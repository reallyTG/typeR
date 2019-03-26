library(GLDEX)


### Name: fun.auto.bimodal.ml
### Title: Fitting mixture of generalied lambda distribtions to data using
###   maximum likelihood estimation via the EM algorithm
### Aliases: fun.auto.bimodal.ml
### Keywords: smooth

### ** Examples

## Fitting faithful data from the dataset library, with the clara clustering 
## regime. The first distribution is RS and the second distribution is fmkl. 
## The percentage of data mix is 1%.

# fun.auto.bimodal.ml(faithful[,1],per.of.mix=0.01,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1,5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)



