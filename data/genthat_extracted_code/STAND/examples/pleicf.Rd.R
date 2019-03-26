library(STAND)


### Name: pleicf
### Title: Product Limit Estimate for Interval Censored Data
### Aliases: pleicf
### Keywords: nonparametric

### ** Examples

# PLE for interval censored filmbadge data
data(filmbadge)
ple.fb<-pleicf(filmbadge[,1:2],FALSE) # PLE for input to qq.lnorm
tmp <- qq.lnorm(ple.fb) ; GM<-round(exp(tmp$par[1]));GSD<-round(exp(tmp$par[2]),2)
tp<-paste("Lognormal Q-Q plot for Filmbadge Data GM= ",GM,"GSD= ",GSD)
title(tp) # title for q-q plot with graphical parameter estimates




