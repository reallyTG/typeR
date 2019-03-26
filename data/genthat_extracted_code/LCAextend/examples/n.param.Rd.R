library(LCAextend)


### Name: n.param
### Title: computes the number of parameters of a model
### Aliases: n.param

### ** Examples

data(ped.cont)
y <- ped.cont[,7:ncol(ped.cont)]
n.param(y,K=3,trans.const=TRUE,optim.indep.norm, 
        optim.probs.indic=c(TRUE,TRUE,TRUE,TRUE),famdep=TRUE)



