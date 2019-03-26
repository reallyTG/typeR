library(baytrends)


### Name: impute
### Title: Impute Censored Values
### Aliases: impute

### ** Examples

x  <- dataCensored[1:20,"tdp"]
x.lower <- impute(x,'lower')
x.mid   <- impute(x,'mid')
x.upper <- impute(x,'upper')
x.norm  <- impute(x,'norm')
x.lnorm <- impute(x,'lnorm')



