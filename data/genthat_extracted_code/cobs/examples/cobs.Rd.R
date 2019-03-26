library(cobs)


### Name: cobs
### Title: COnstrained B-Splines Nonparametric Regression Quantiles
### Aliases: cobs
### Keywords: smooth regression

### ** Examples

x <- seq(-1,3,,150)
y <- (f.true <- pnorm(2*x)) + rnorm(150)/10
## specify pointwise constraints (boundary conditions)
con <- rbind(c( 1,min(x),0), # f(min(x)) >= 0
             c(-1,max(x),1), # f(max(x)) <= 1
             c(0,  0,   0.5))# f(0)      = 0.5

## obtain the median  REGRESSION  B-spline using automatically selected knots
Rbs <- cobs(x,y, constraint= "increase", pointwise = con)
Rbs
plot(Rbs, lwd = 2.5)
lines(spline(x, f.true), col = "gray40")
lines(predict(cobs(x,y)), col = "blue")
mtext("cobs(x,y)   # completely unconstrained", 3, col= "blue")

## compute the median  SMOOTHING  B-spline using automatically chosen lambda
Sbs <- cobs(x,y, constraint="increase", pointwise= con, lambda= -1)
summary(Sbs)
plot(Sbs) ## by default  includes  SIC ~ lambda

Sb1 <- cobs(x,y, constraint="increase", pointwise= con, lambda= -1,
            degree = 1)
summary(Sb1)
plot(Sb1)

plot(Sb1, which = 2) # only the  data + smooth
rug(Sb1$knots, col = 4, lwd = 1.6)# (too many knots)
xx <- seq(min(x) - .2, max(x)+ .2, len = 201)
pxx <- predict(Sb1, xx, interval = "both")
lines(pxx, col = 2)
mtext(" + pointwise and simultaneous 95% - confidence intervals")
matlines(pxx[,1], pxx[,-(1:2)], col= rep(c("green3","blue"), c(2,2)), lty=2)



