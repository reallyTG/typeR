library(svars)


### Name: id.cv
### Title: Changes in volatility identification of SVAR models
### Aliases: id.cv

### ** Examples

## No test: 
# data contains quartlery observations from 1965Q1 to 2008Q2
# assumed structural break in 1979Q3
# x = output gap
# pi = inflation
# i = interest rates
set.seed(23211)
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
x1 <- id.cv(v1, SB = 59)
summary(x1)

# switching columns according to sign patter
x1$B <- x1$B[,c(3,2,1)]
x1$B[,3] <- x1$B[,3]*(-1)

# Impulse response analysis
i1 <- irf(x1, n.ahead = 30)
plot(i1, scales = 'free_y')

# Restrictions
# Assuming that the interest rate doesn't influence the output gap on impact
restMat <- matrix(rep(NA, 9), ncol = 3)
restMat[1,3] <- 0
x2 <- id.cv(v1, SB = 59, restriction_matrix = restMat)
summary(x2)

#Structural brake via Dates
# given that time series vector with dates is available
dateVector = seq(as.Date("1965/1/1"), as.Date("2008/7/1"), "quarter")
x3 <- id.cv(v1, SB = "1979-07-01", format = "%Y-%m-%d", dateVector = dateVector)
summary(x3)

# or pass sequence arguments directly
x4 <- id.cv(v1, SB = "1979-07-01", format = "%Y-%m-%d", start = "1965-01-01", end = "2008-07-01",
frequency = "quarter")
summary(x4)

# or provide ts date format (For quarterly, monthly, weekly and daily frequencies only)
x5 <- id.cv(v1, SB = c(1979, 3))
summary(x5)

## End(No test)



