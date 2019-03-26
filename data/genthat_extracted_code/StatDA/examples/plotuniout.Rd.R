library(StatDA)


### Name: plotuniout
### Title: Multivariate outlier plot for each dimension
### Aliases: plotuniout
### Keywords: aplot univar

### ** Examples

data(moss)
el=c("Ag","As","Bi","Cd","Co","Cu","Ni")
dat=log10(moss[,el])

ans<-plotuniout(dat,symb=FALSE,cex2=c(0.9,0.1),pch2=c(3,21))



