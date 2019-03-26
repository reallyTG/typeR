library(multiCA)


### Name: cnonct
### Title: Non-centrality parameter for chi-square distribution
### Aliases: cnonct

### ** Examples

(ncp <- cnonct(qchisq(0.95, df=10), 0.8, df=10))
## check
pchisq(qchisq(0.95, df=10), df=10, ncp=ncp)  ## 0.8



