library(Sleuth2)


### Name: case1502
### Title: Global Warming
### Aliases: case1502
### Keywords: datasets

### ** Examples

str(case1502)

# Residuals from regression fit, ignoring autocorrelation
resids <- lm(Temp ~ Year, case1502)$res
# PACF plot shows evidence of 1st order auto correlation
acf(resids,type="partial")
# 1st autocorrelation coef.
acorr1 <- acf(resids,type="correlation",plot=FALSE)$acf[2] 

# Fit regression with filtered response and explanatory variables:
n <- length(case1502$Temp)
y <- with(case1502, Temp [2:n] - acorr1* Temp [1:(n-1)])
x <- with(case1502, Year [2:n] - acorr1* Year [1:(n-1)])
fit <- lm(y ~ x)
summary(fit)  # Interpret coefficient of x as coefficient of Year



