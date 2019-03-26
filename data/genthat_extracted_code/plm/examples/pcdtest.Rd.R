library(plm)


### Name: pcdtest
### Title: Tests of cross-section dependence for panel models
### Aliases: pcdtest pcdtest.formula pcdtest.panelmodel pcdtest.pseries
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
## test on heterogeneous model (separate time series regressions)
pcdtest(inv ~ value + capital, data = Grunfeld,
        index = c("firm", "year"))

## test on two-way fixed effects homogeneous model
pcdtest(inv ~ value + capital, data = Grunfeld, model = "within",
        effect = "twoways", index = c("firm", "year"))

## test on panelmodel object
g <- plm(inv ~ value + capital, data = Grunfeld, index = c("firm", "year"))
pcdtest(g)

## scaled LM test
pcdtest(g, test = "sclm")

## test on pseries
pGrunfeld <- pdata.frame(Grunfeld)
pcdtest(pGrunfeld$value)

## local test
## define neighbours for individual 2: 1, 3, 4, 5 in lower triangular matrix
w <- matrix(0, ncol= 10, nrow=10)
w[2,1] <- w[3,2] <- w[4,2] <- w[5,2] <- 1
pcdtest(g, w = w)



