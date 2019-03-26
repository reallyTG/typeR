library(DiceKriging)


### Name: kmData
### Title: Fit and/or create kriging models
### Aliases: kmData
### Keywords: models htest

### ** Examples

# a 16-points factorial design, and the corresponding response
d <- 2; n <- 16
design.fact <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4))
y <- apply(design.fact, 1, branin)
data <- cbind(design.fact, y=y)

# kriging model 1 : matern5_2 covariance structure, no trend, no nugget effect
m1 <- kmData(y~1, data=data)
# this is equivalent to: m1 <- km(design=design.fact, response=y)

# now, add a second response to data:
data2 <- cbind(data, y2=-y)
# the previous model is now obtained with:
m1_2 <- kmData(y~1, data=data2, inputnames=c("x1", "x2"))




