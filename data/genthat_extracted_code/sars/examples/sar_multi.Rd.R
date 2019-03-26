library(sars)


### Name: sar_multi
### Title: Fit a multimodel SAR curve
### Aliases: sar_multi

### ** Examples

data(galap)
#attempt to construct a multimodel SAR curve using all twenty sar models
fit <- sar_multi(galap)
summary(fit)
plot(fit)

# construct a multimodel SAR curve using a fit_collection object
s1 <- sar_power(galap)
s2 <- sar_expo(galap)
s3 <- sar_koba(galap)
ff <- fit_collection(s1, s2, s3)
fit2 <- sar_multi(galap, obj = ff)
summary(fit2)

# construct a multimodel SAR curve without conducting any model checks
fit3 <- sar_multi(galap, normaTest = "none", homoTest = "none", neg_check = FALSE)




