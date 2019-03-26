library(svars)


### Name: id.st
### Title: Identification of SVAR models by means of a smooth transition of
###   volatility
### Aliases: id.st

### ** Examples

## No test: 
# data contains quartlery observations from 1965Q1 to 2008Q2
# x = output gap
# pi = inflation
# i = interest rates
set.seed(23211)
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.st(v1, c_fix = 80, gamma_fix = 0)
summary(x1)
plot(x1)

# switching columns according to sign patter
x1$B <- x1$B[,c(3,2,1)]
x1$B[,3] <- x1$B[,3]*(-1)

# Impulse response analysis
i1 <- irf(x1, n.ahead = 30)
plot(i1, scales = 'free_y')

# Example with same data set as in Luetkepohl and Nestunajev 2017
v1 <- vars::VAR(LN, p = 3, type = 'const')
x1 <- id.st(v1, c_fix = 167, gamma_fix = -2.77)
summary(x1)
plot(x1)

## End(No test)



