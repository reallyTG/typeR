library(hcc)


### Name: windmill
### Title: Direct current output was measured against wind velocity
### Aliases: windmill
### Keywords: datasets

### ** Examples

data(windmill)
g1<-lm(Y~x,data=windmill)
res<- resid(g1)
x<- windmill[,2]
hctest(x,res)



