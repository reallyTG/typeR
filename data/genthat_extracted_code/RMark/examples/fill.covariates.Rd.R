library(RMark)


### Name: fill.covariates
### Title: Fill covariate entries in MARK design matrix with values
### Aliases: fill.covariates
### Keywords: utility

### ** Examples

## No test: 
data(dipper)
dipper$nsex=as.numeric(dipper$sex)-1
dipper$weight=rnorm(294)   
#NOTE:  This generates random valules for the weights so the answers using 
# ~weight will vary each time it is run
mod=mark(dipper,model.parameters=list(Phi=list(formula=~nsex+weight)))
# Show approach using individual calls to find.covariates, fill.covariates 
# and compute.real
fc=find.covariates(mod,dipper)
fc$value[fc$var=="nsex"]=0 # assign sex value to Female
design=fill.covariates(mod,fc) # fill design matrix with values
# compute and output survivals for females at average weight
female.survival=compute.real(mod,design=design)[1,] 
female.survival
# Next show same thing with a call to compute.real and a data frame for 
# females and then males
# compute and output survivals for females at average weight
female.survival=compute.real(mod,data=
      data.frame(nsex=0,weight=mean(dipper$weight)))[1,] 
female.survival
male.survival=compute.real(mod,data=data.frame(nsex=1,
         weight=mean(dipper$weight)))[1,] 
male.survival
# Fit model using sex as a group/factor variable and 
# compute v-c matrix for estimates
mod=mark(dipper,groups="sex",
     model.parameters=list(Phi=list(formula=~sex+weight)))
survival.by.sex=compute.real(mod,data=dipper,vcv=TRUE)
survival.by.sex$real[1:2]  # estimates
survival.by.sex$se.real[1:2] # std errors
survival.by.sex$vcv.real[1:2,1:2] # v-c matrix
survival.by.sex$vcv.real[1,2]/prod(survival.by.sex$se.real[1:2]) 
# sampling correlation of the estimates
## End(No test)



