library(rockchalk)


### Name: genCorrelatedData2
### Title: Generates a data frame for regression analysis.
### Aliases: genCorrelatedData2

### ** Examples

## 1000 observations of uncorrelated X with no interactions
set.seed(234234)
dat <- genCorrelatedData2(N = 10, rho = 0.0, beta = c(1, 2, 1, 1),
    means = c(0,0,0), sds = c(1,1,1), stde = 0)
summarize(dat)
## The perfect regression!
m1 <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m1)

dat <- genCorrelatedData2(N = 1000, rho = 0,
    beta = c(1, 0.2, -3.3, 1.1), stde = 50)
m1 <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m1)
predictOMatic(m1)
plotCurves(m1, plotx = "x2")

## interaction between x1 and x2
dat <- genCorrelatedData2(N = 1000, rho = 0.2,
    beta = c(1, 1.0, -1.1, 0.1, 0.0, 0.16), stde = 1)
summarize(dat)
## Fit wrong model? get "wrong" result
m2w <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m2w)
## Include interaction
m2 <- lm(y ~ x1 * x2 + x3, data = dat)
summary(m2)

dat <- genCorrelatedData2(N = 1000, rho = 0.2,
    beta = c(1, 1.0, -1.1, 0.1, 0.0, 0.16), stde = 100)
summarize(dat)
m2.2 <- lm(y ~ x1 * x2 + x3, data = dat)
summary(m2.2)

dat <- genCorrelatedData2(N = 1000, means = c(100, 200, 300, 100),
    sds = 20,  rho = c(0.2, 0.3, 0.1, 0, 0, 0),
    beta = c(1, 1.0, -1.1, 0.1, 0.0, 0.16, 0, 0, 0.2, 0, 0, 1.1, 0, 0, 0.1),
    stde = 200)
summarize(dat)
m2.3w <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m2)

m2.3 <- lm(y ~ x1 * x2 + x3, data = dat)
summary(m2.3)

predictOMatic(m2.3)
plotCurves(m2.3, plotx = "x1", modx = "x2", modxVals = "std.dev.", n = 5)

simReg <- lapply(1:100, function(x){
    dat <- genCorrelatedData2(N = 1000, rho = c(0.2),
        beta = c(1, 1.0, -1.1, 0.1, 0.0, 0.46), verbose = FALSE)
    mymod <- lm (y ~ x1 * x2 + x3, data = dat)
    summary(mymod)
})

x3est <- sapply(simReg, function(reg) {coef(reg)[4 ,1] })
summarize(x3est)
hist(x3est,  breaks = 40, prob = TRUE,
    xlab = "Estimated Coefficients for column x3")

r2est <- sapply(simReg, function(reg) {reg$r.square})
summarize(r2est)
hist(r2est,  breaks = 40, prob = TRUE, xlab = "Estimates of R-square")

## No interaction, collinearity
dat <- genCorrelatedData2(N = 1000, rho = c(0.1, 0.2, 0.7),
    beta = c(1, 1.0, -1.1, 0.1), stde = 1)
m3 <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m3)

dat <- genCorrelatedData2(N=1000, rho=c(0.1, 0.2, 0.7),
    beta = c(1, 1.0, -1.1, 0.1), stde = 200)
m3 <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m3)
mcDiagnose(m3)

dat <- genCorrelatedData2(N = 1000, rho = c(0.9, 0.5, 0.4),
    beta = c(1, 1.0, -1.1, 0.1), stde = 200)
m3b <- lm(y ~ x1 + x2 + x3, data = dat)
summary(m3b)
mcDiagnose(m3b)




