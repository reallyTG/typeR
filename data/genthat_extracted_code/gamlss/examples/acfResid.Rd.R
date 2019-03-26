library(gamlss)


### Name: acfResid
### Title: ACF plot of the residuals
### Aliases: acfResid
### Keywords: regresson ts

### ** Examples

library(datasets)
data(co2)
m1<- gamlss(co2~pb(as.numeric(time(co2)))+factor(cycle(co2)))
acfResid(m1)



