library(agridat)


### Name: pearce.apple
### Title: Apple tree yields for 6 treatments with covariate
### Aliases: pearce.apple
### Keywords: datasets

### ** Examples


data(pearce.apple)
dat <- pearce.apple

require(lattice)
xyplot(yield~prev|block, dat, main="pearce.apple", xlab="previous yield")

# Univariate fixed-effects model of Booth et al, using previous
# yield as a covariate.
m1 <- lm(yield ~ trt + block + prev, data=dat)
# Predict values, holding the covariate at its overall mean of 8.3
newdat <- expand.grid(trt=c('A','B','C','D','E','S'),
                      block=c('B1','B2','B3','B4'), prev=8.308333)
newdat$pred <- predict(m1, newdata=newdat)
# Average across blocks to get the adjusted mean, Booth et al. Table 1
tapply(newdat$pred, newdat$trt, mean)
#        A        B        C        D        E        S
# 280.4765 266.5666 274.0666 281.1370 300.9175 251.3357

# Same thing, but with blocks random
if(require(lme4)){
m2 <- lmer(yield ~ trt + (1|block) + prev, data=dat)
newdat$pred2 <- predict(m2, newdata=newdat)
tapply(newdat$pred2, newdat$trt, mean)
#        A        B        C        D        E        S
# 280.4041 266.5453 274.0453 281.3329 301.3432 250.8291
}




