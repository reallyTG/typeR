library(TeachingDemos)


### Name: rgl.coin
### Title: Animated die roll or coin flip
### Aliases: rgl.coin rgl.die flip.rgl.coin roll.rgl.die
### Keywords: dynamic datagen distribution

### ** Examples

if(interactive()){
rgl.coin()
flip.rgl.coin()
flip.rgl.coin(1)
flip.rgl.coin(2)

rgl.clear()

# two-headed coin
rgl.coin(tails=coin.faces$qh)

rgl.clear()

# letters instead of pictures
rgl.coin(heads=coin.faces$H, tails=coin.faces$T)

# biased flip
flip.rgl.coin( sample(2,1, prob=c(0.65, 0.35) ) )

rgl.clear()

rgl.die()
roll.rgl.die()
roll.rgl.die(6)

# biased roll
roll.rgl.die( sample(6,1, prob=c(1,2,3,3,2,1) ) )
}



