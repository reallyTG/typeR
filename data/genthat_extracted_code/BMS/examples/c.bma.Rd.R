library(BMS)


### Name: c.bma
### Title: Concatenate bma objects
### Aliases: combine_chains c.bma
### Keywords: models

### ** Examples

 data(datafls)
  
 #MCMC case ############################
 model1=bms(datafls,burn=1000,iter=4000,mcmc="bd",start.value=c(20,30,35))
 model2=bms(datafls,burn=1500,iter=7000,mcmc="bd",start.value=c(1,10,15))
 
 model_all=c(model1,model2)
 coef(model_all)
 plot(model_all)
 
 
 
 #splitting enumeration ########################
 
 #standard case with 12 covariates (4096 differnt combinations):
 enum0=bms(datafls[,1:13],mcmc="enumerate")
 
 # now split the task:
 # enum1 does everything from model zero (the first model) to model 1999
 enum1=bms(datafls[,1:13],mcmc="enumerate",start.value=0,iter=1999)
 
 # enum2 does models from index 2000 to the index 3000 (in total 1001 models)
 enum2=bms(datafls[,1:13],mcmc="enumerate",start.value=2000,iter=1000)
 
 # enum3 does models from index 3001 to the end
 enum3=bms(datafls[,1:13],mcmc="enumerate",start.value=3001)
 
 enum_combi=c(enum1,enum2,enum3)
 coef(enum_combi)
 coef(enum0)
 #both enum_combi and enum0 have exactly the same results 
 #(one difference: enum_combi has more 'top models' (1500 instead of 500))




