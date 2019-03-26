library(svars)


### Name: chow.test
### Title: Chow Test for Structural Break
### Aliases: chow.test

### ** Examples

## No test: 
# Testing for structural break in USA data
#' # data contains quartlery observations from 1965Q1 to 2008Q2
# assumed structural break in 1979Q3
# x = output gap
# pi = inflation
# i = interest rates
set.seed(23211)
v1 <- vars::VAR(USA, lag.max = 10, ic = "AIC" )
z1 <- chow.test(v1, SB = 59)
summary(z1)

#Using stability() to find potential break point and sample split
x1 <- stability(v1, type = "mv-chow-test")
plot(x1)
z1.1 <- chow.test(x1)
summary(z1.1)
#Or using sample split as benchmark
x1$break_point <- FALSE
z1.1 <- chow.test(x1)
summary(z1.1)

#Structural brake via Dates
#given that time series vector with dates is available
dateVector <- seq(as.Date("1965/1/1"), as.Date("2008/7/1"), "quarter")
z2 <- chow.test(v1, SB = "1979-07-01", format = "%Y-%m-%d", dateVector = dateVector)
summary(z2)

# alternatively pass sequence arguments directly
z3 <- chow.test(v1, SB = "1979-07-01", format = "%Y-%m-%d",
                start = "1965-01-01", end = "2008-07-01",
                frequency = "quarter")
summary(z3)

# or provide ts date format (For quarterly, monthly, weekly and daily frequencies only)
z4 <- chow.test(v1, SB = c(1979,3))
summary(z4)
## End(No test)



