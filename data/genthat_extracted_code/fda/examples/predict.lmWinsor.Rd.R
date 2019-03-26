library(fda)


### Name: predict.lmWinsor
### Title: Predict method for Winsorized linear model fits
### Aliases: predict.lmWinsor
### Keywords: models

### ** Examples

# example from 'anscombe'
# trim = 0 
lm.1 <- lmWinsor(y1~x1, data=anscombe)

newD <- data.frame(x1=seq(1, 22, .1))
predW <- predict(lm.1, newdata=newD) 
plot(y1~x1, anscombe, xlim=c(1, 22),
     main="Anscombe, example 1") 
lines(newD[["x1"]], predW, col='blue')
abline(h=lm.1[['lower']]['y1'], col='red', lty='dashed') 
abline(h=lm.1[['upper']]['y1'], col='red', lty='dashed')
abline(v=lm.1[['lower']]['x1'], col='green', lty='dashed') 
abline(v=lm.1[['upper']]['x1'], col='green', lty='dashed')
# clipped at range(anscombe[, 'x1']) = c(4, 14)
## Don't show: 
coef.1 <- c(3, .5)+1/11000
x.1c <- pmax(4, pmin(newD[['x1']], 14))
pred.1 <- coef.1[1] + x.1c*coef.1[2]
y1Lim <- range(anscombe[, 'y1'])
pred.1c <- pmax(y1Lim[1], pmin(y1Lim[2], pred.1))
stopifnot(all.equal(as.numeric(predW), pred.1c))
## End(Don't show)

# trim = 0.25 
lm.1.25 <- lmWinsor(y1~x1, data=anscombe, trim=0.25)

newD <- data.frame(x1=seq(1, 22, .1))
predW.25 <- predict(lm.1.25, newdata=newD) 
plot(y1~x1, anscombe, xlim=c(1, 22)) 
lines(newD[["x1"]], predW.25, col='blue', lwd=2)
abline(h=lm.1.25[['lower']]['y1'], col='red', lty='dotted') 
abline(h=lm.1.25[['upper']]['y1'], col='red', lty='dotted')
abline(v=lm.1.25[['lower']]['x1'], col='green', lty='dotted') 
abline(v=lm.1.25[['upper']]['x1'], col='green', lty='dotted')
# clipped at range(anscombe[, 'y1']) = c(4.26 10.84)
## Don't show: 
c.25 <- c(3.3835, 0.451)
pred.25 <- c.25[1] + c.25[2]*newD[['x1']]
pred.25c <- pmax(6.315, pmin(8.57, pred.25))
stopifnot(all.equal(as.numeric(predW.25), pred.25c) )
## End(Don't show)

# list example
lm.1. <- lmWinsor(y1~x1, data=anscombe, trim=c(0, 0.25, .4, .5)) 
pred.1. <- predict(lm.1.)




