library(seawaveQ)


### Name: compwaveconv
### Title: Seasonal Wave Computation
### Aliases: compwaveconv
### Keywords: datagen

### ** Examples

# evaluate seasonal wave for specified decimal seasons
# these example decimal dates represent days at points 0.25, 0.5, and
# 0.75 percent of the way through the year and the end of the year
dseas <- c(0.25, 0.5, 0.75, 1)
swave <- compwaveconv(cmaxt=0.483, jmod=2, hlife=4, mclass=1)
swave[floor(360 * dseas)]
plot(seq(0,1,1/360),swave, typ="l")



