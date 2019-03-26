library(sra)


### Name: 4. Methods for srafit objects 
### Title: Overloaded functions for "srafit" objects
### Aliases: AIC.srafit coef.srafit logLik.srafit confint.srafit
###   vcov.srafit
### Keywords: methods

### ** Examples

########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

cstvar <- sraCstvar(data)

AIC(cstvar)
logLik(cstvar)
coef(cstvar)
confint(cstvar)
vcov(cstvar)



