library(VAR.etp)


### Name: VAR.FOR
### Title: VAR Forecasting
### Aliases: VAR.FOR
### Keywords: ts

### ** Examples

#replicating Section 3.5.3 of Lutkepohl (2005)
data(dat)
VAR.FOR(dat,p=2,h=10,type="const",alpha=0.95)



