library(lifecontingencies)


### Name: demoChina
### Title: China Mortality Rates for life table construction
### Aliases: demoChina
### Keywords: datasets

### ** Examples

data(demoChina)
tableChinaCL1<-probs2lifetable(probs=demoChina$CL1,radix=1000,type="qx",name="CHINA CL1")



