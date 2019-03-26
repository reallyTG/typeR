library(agridat)


### Name: streibig.competition
### Title: Competition experiment between barley and sinapis.
### Aliases: streibig.competition
### Keywords: datasets

### ** Examples


data(streibig.competition)
dat <- streibig.competition

# See Schaberger and Pierce, pages 370+
# Consider only the mono-species barley data (no competition from sinapis)
d1 <- subset(dat, sseeds<1)
d1 <- transform(d1, x=bseeds, y=bdwt, block=factor(block))

# Inverse yield looks like it will be a good fit for Gamma's inverse link
require(lattice)
xyplot(1/y~x, data=d1, group=block, auto.key=list(columns=3),
       xlab="Seeding rate", ylab="Inverse yield of barley dry weight",
       main="streibig.competition")

# linear predictor is quadratic, with separate intercept and slope per block
m1 <- glm(y ~ block + block:x + x+I(x^2), data=d1,
          family=Gamma(link="inverse"))
# Predict and plot
newdf <- expand.grid(x=seq(0,120,length=50), block=factor(c('B1','B2','B3')) )
newdf$pred <- predict(m1, new=newdf, type='response')
plot(y~x, data=d1, col=block, main="streibig.competition - by block",
     xlab="Barley seeds", ylab="Barley dry weight")
for(bb in 1:3){
  newbb <- subset(newdf, block==c('B1','B2','B3')[bb])
  lines(pred~x, data=newbb, col=bb)
}




