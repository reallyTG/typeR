library(ARCensReg)


### Name: rARCens
### Title: Generating Censored Autoregressive Data
### Aliases: rARCens
### Keywords: package censored regression autoregressive errors

### ** Examples

#generating a sample
dat = rARCens(n=100,beta = c(1,-1),pit = c(.4,-.2),
     sig2=.5,x=cbind(1,runif(100)),cens='left',pcens=.05)
#
plot.ts(dat$data$y)
table(dat$data$cc)

dat$param
#[1]  1.00 -1.00  0.50  0.48 -0.20



