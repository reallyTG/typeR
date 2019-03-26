library(scam)


### Name: anova.scam
### Title: Approximate hypothesis tests related to SCAM fits
### Aliases: anova.scam print.anova.scam
### Keywords: models smooth regression

### ** Examples

library(scam)
set.seed(0)
fac <- rep(1:4,20)
x1 <- runif(80)*5
x2 <- runif(80,-1,2)
x3 <- runif(80, 0, 1)
y <- fac+log(x1)/5
y <- y + exp(-1.3*x2) +rnorm(80)*0.1
fac <- factor(fac)
b <- scam(y ~ fac+s(x1,bs="mpi")+s(x2,bs="mpd")+s(x3))

b1 <- scam(y ~ fac+s(x1,bs="mpi")+s(x2,bs="mpd"))
anova(b,b1,test="F")

## b2 <- scam(y ~ fac +s(x1)+s(x2)+te(x1,x2))




