library(STAND)


### Name: qq.lnorm
### Title: Quantile-Quantile Plot for Censored Lognormal Data
### Aliases: qq.lnorm
### Keywords: hplot

### ** Examples

data(SESdata) #  use SESdata data set Example 1 from ORNLTM-2005/52
pnd<- plend(SESdata)
qq.lnorm(pnd) #  lognormal q-q plot based on PLE 
Ia <- "Q-Q plot For SESdata "
qqout <- qq.lnorm(pnd,main=Ia) #  lognormal q-q plot based on PLE 
qqout



