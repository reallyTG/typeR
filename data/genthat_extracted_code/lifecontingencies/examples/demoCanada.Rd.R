library(lifecontingencies)


### Name: demoCanada
### Title: Canada Mortality Rates for UP94 Series
### Aliases: demoCanada
### Keywords: datasets

### ** Examples

data(demoCanada)
head(demoCanada)
#create the up94M life table
up94MLt<-probs2lifetable(probs=demoCanada$up94M,radix=100000,"qx",name="UP94")
#create the up94M actuarial table table
up94MAct<-new("actuarialtable", lx=up94MLt@lx, x=up94MLt@x,interest=0.02)



