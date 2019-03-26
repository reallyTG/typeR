library(hcc)


### Name: ozone
### Title: Ozone readings in LA
### Aliases: ozone
### Keywords: datasets

### ** Examples

data(ozone)
alm <- lm(O3 ~ vis+doy+ibt+humidity+temp,data=ozone)
res <- resid(alm)
hctest(ozone[,10], res)



