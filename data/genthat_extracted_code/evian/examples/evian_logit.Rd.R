library(evian)


### Name: evian_logit
### Title: Evidential analysis for binary outcome data using logistic
###   regression models
### Aliases: evian_logit

### ** Examples


data(eviandata_binary)
data(evianmap_binary)
## Don't show: 
rst1=evian_logit(data=eviandata_binary, bim=evianmap_binary, xcols=10:14, ycol=6, robust=FALSE,
model="additive", m=100, kcutoff = c(32,100), multiThread=1)
## End(Don't show)
## No test: 
rst1=evian_logit(data=eviandata_binary, bim=evianmap_binary, xcols=10:19, ycol=6, robust=FALSE,
model="additive", m=1000, kcutoff = c(32,100), multiThread=1)

#Alternatively you can use the formula argument to run the same model as above

rst2=evian_logit(data=eviandata_binary, bim=evianmap_binary, formula='PHENOTYPE~rs461+rs462+rs477+
rs479+rs491+rs492+rs504+rs509+rs519+rs542', robust=FALSE, model="additive",
m=1000, kcutoff = c(32,100), multiThread=1)
## End(No test)



