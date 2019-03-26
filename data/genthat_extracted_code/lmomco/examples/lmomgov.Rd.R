library(lmomco)


### Name: lmomgov
### Title: L-moments of the Govindarajulu Distribution
### Aliases: lmomgov
### Keywords: L-moment (distribution) Distribution: Govindarajulu

### ** Examples

lmr <- lmoms(c(123,34,4,654,37,78))
lmorph(lmr)
lmomgov(pargov(lmr))
## Not run: 
##D Bs <- exp(seq(log(.01),log(10000),by=.05))
##D T3 <- (Bs-2)/(Bs+4)
##D T4 <- (Bs-5)*(Bs-1)/((Bs+4)*(Bs+5))
##D plotlmrdia(lmrdia(), autolegend=TRUE)
##D points(T3, T4)
##D T3s <- c(-0.5,T3,1)
##D T4s  <- c(0.25,T4,1)
##D the.lm <- lm(T4s~T3s+I(T3s^2)+I(T3s^3)+I(T3s^4)+I(T3s^5))
##D lines(T3s, predict(the.lm), col=2)
##D max(residuals(the.lm))
##D summary(the.lm)
## End(Not run)



