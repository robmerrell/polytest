//
//  HelloWorldLayer.m
//  polytest
//
//  Created by Rob Merrell on 6/8/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "PRFilledPolygon.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"green_paper_texture.png"];
        PRFilledPolygon *poly = [[PRFilledPolygon alloc] initWithPoints:[NSArray arrayWithObjects:
                                                           [NSValue valueWithCGPoint:ccp(0, 0)],
                                                           [NSValue valueWithCGPoint:ccp(100, 0)],
                                                           [NSValue valueWithCGPoint:ccp(100, 100)],
                                                           [NSValue valueWithCGPoint:ccp(0, 100)],
                                                           nil] andTexture:texture];    
        poly.position = ccp(200, 200);
        [self addChild:poly];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

@end
