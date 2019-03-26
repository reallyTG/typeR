library(rockchalk)


### Name: mcGraph1
### Title: Illustrate multicollinearity in regression, part 1.
### Aliases: mcGraph1 mcGraph2 mcGraph3
### Keywords: hplot regression

### ** Examples

set.seed(12345)
## Create data with x1 and x2 correlated at 0.10
dat <- genCorrelatedData(rho=.1, stde=7)

mcGraph1(dat$x1, dat$x2, dat$y, theta=20, phi=8, ticktype="detailed", nticks=10)

set.seed(12345)
## Create data with x1 and x2 correlated at 0.10
dat <- genCorrelatedData(rho=.1, stde=7)
## This will "grow" the "cloud" of points up from the
## x1-x2 axis
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.0, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.1, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.2, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.3, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.4, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.5, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.6, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.7, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.8, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 0.9, theta = 0)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 1, theta = 0)

##rotate this
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 1, theta = 20)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 1, theta = 40)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 1, theta = 60)
mcGraph2(dat$x1, dat$x2, dat$y, rescaley = 1, theta = 80)

## once they reach the top, make them glitter a while
for(i in 1:20){
  mcGraph2(dat$x1, dat$x2, dat$y, rescaley = runif(length(dat$x1), .9,1.1), theta = 0)
}

set.seed(12345)
## Create data with x1 and x2 correlated at 0.10
dat <- genCorrelatedData(rho=.1, stde=7)

mcGraph3(dat$x1, dat$x2, dat$y, theta = 0)

dat2 <- genCorrelatedData(rho = 0, stde = 7)

mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = 0, phi = 10)
mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = 30, phi = 10)
mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = -30, phi = 10)
mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = -30, phi = -10)
mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = -30, phi = -15)

## Run regressions with not-strongly correlated data
modset1 <- list()
for(i in 1:20){
  dat2 <- genCorrelatedData(rho = .1, stde = 7)
  summary(lm( y ~ x1 + x2 , data = dat2))
  modset1[[i]] <- mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = -30)
}


## Run regressions with strongly correlated data
modset2 <- list()
for(i in 1:20){
  dat2 <- genCorrelatedData(rho = .981, stde = 7)
  summary(lm( y ~ x1 + x2 , data = dat2))
  modset2[[i]] <- mcGraph3(dat2$x1, dat2$x2, dat2$y, theta = -30)
}

dat3 <- genCorrelatedData(rho = .981, stde = 100, beta=c(0.1, 0.2, 0.3, -0.1))
mcGraph3(dat3$x1, dat3$x2, dat3$y, theta=-10, interaction = TRUE)



