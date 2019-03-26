library(svars)


### Name: id.ngml
### Title: Non-Gaussian maximum likelihood identification of SVAR models
### Aliases: id.ngml

### ** Examples

## No test: 
# data contains quarterly observations from 1965Q1 to 2008Q3
# x = output gap
# pi = inflation
# i = interest rates
set.seed(23211)
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.ngml(v1)
summary(x1)

# switching columns according to sign pattern
x1$B <- x1$B[,c(3,2,1)]
x1$B[,3] <- x1$B[,3]*(-1)

# impulse response analysis
i1 <- irf(x1, n.ahead = 30)
plot(i1, scales = 'free_y')
## End(No test)



