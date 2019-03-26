library(BMS)


### Name: gprior-class
### Title: Class "gprior"
### Aliases: gprior-class
### Keywords: classes

### ** Examples


data(datafls)
mm1=bms(datafls[,1:10], g="EBL")
gg=mm1$gprior.info # is the g-prior object, augmented with some posterior statistics

mm2=bms(datafls[,1:10], g=gg) #produces the same result

mm3=bms(datafls[,1:10], g=BMS:::.gprior.eblocal.init) 
#this passes BMS's internal Empirical Bayes g-prior object as the coefficient prior 
# - any other obejct might be used as well





