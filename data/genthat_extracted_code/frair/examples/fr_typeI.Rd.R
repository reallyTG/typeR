library(frair)


### Name: fr_typeI
### Title: Type I Response
### Aliases: fr_typeI typeI typeI_fit typeI_nll

### ** Examples

datx <- rep(1:60, times=5)
r1 <- rnorm(60*5, mean = 0.25, sd = 0.1)
r2 <- rnorm(60*5, mean = 0.75, sd = 0.1)
r1[r1>1] <- 1
r2[r2>1] <- 1
daty1 <- abs(round(r1*datx, 0))
daty2 <- abs(round(r2*datx, 0))
dat <- data.frame(datx,daty1,daty2)

TI1 <- frair_fit(daty1~datx, data=dat, response='typeI', 
        start=list(a=0.5), fixed=list(T=1))
TI2 <- frair_fit(daty2~datx, data=dat, response='typeI', 
        start=list(a=0.5), fixed=list(T=1))

plot(c(0,60), c(0,60), type='n', xlab='Density', ylab='No. Eaten')
points(TI1)
points(TI2, col=4)
lines(TI1)
lines(TI2, col=4)

# Test with frair_compare
frair_compare(TI1, TI2)

## Not run: 
##D # Test with a big stick
##D TI1b <- frair_boot(TI1)
##D TI2b <- frair_boot(TI2)
##D confint(TI1b)
##D confint(TI2b)
##D 
##D plot(c(0,60), c(0,60), type='n', xlab='Density', ylab='No. Eaten')
##D drawpoly(TI1b, col=1)
##D drawpoly(TI2b, col=4)
##D points(TI1b, pch=20)
##D points(TI2b, pch=20, col=4)
## End(Not run)




