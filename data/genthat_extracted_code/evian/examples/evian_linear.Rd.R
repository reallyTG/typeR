library(evian)


### Name: evian_linear
### Title: Evidential analysis for quantitative outcome data using linear
###   regression models
### Aliases: evian_linear

### ** Examples


data(eviandata_linear)
data(evianmap_linear)
## Don't show: 
rst1=evian_linear(data=eviandata_linear, bim=evianmap_linear, xcols=10:ncol(eviandata_linear),
ycol=6, covariateCol=c(5,7:9), robust=FALSE, model="additive", m=100, lolim=-0.4,
hilim=0.4, kcutoff = c(32,100), multiThread=1)
## End(Don't show)
## No test: 
rst1=evian_linear(data=eviandata_linear, bim=evianmap_linear, xcols=10:ncol(eviandata_linear),
ycol=6, covariateCol=c(5,7:9), robust=FALSE, model="additive",
m=1000, kcutoff = c(32,100), multiThread=1)

#Alternatively you can use the formula argument to run the same model as above

rst2=evian_linear(data=eviandata_linear, bim=evianmap_linear,
formula='Y_norma~Fev+SEX+Age_group+BMI_group+rs141+rs912+rs573+rs414+rs635+
rs356+rs877+rs168+rs449+rs580', robust=FALSE,
model="additive", m=1000, kcutoff = c(32,100), multiThread=1)
## End(No test)



