library(spTDyn)


### Name: sp
### Title: Defining spatially varying coefficients in the formula
### Aliases: sp
### Keywords: spT

### ** Examples

## Don't show: 
##
library(spTDyn)
# Read data 
data(NYdata); 
# Define the coordinates
coords<-as.matrix(unique(cbind(NYdata[,2:3])))

# MCMC via Gibbs using default choices
set.seed(11)
post.gp <- GibbsDyn(formula=o8hrmax ~cMAXTMP+WDSP+sp(RH),   
         nItr=100,nBurn=0,  
         data=NYdata, coords=coords, scale.transform="SQRT")
print(post.gp)
##
## End(Don't show)
## No test: 
##

###########################
## Attach library spTimer
###########################

library(spTDyn)

###########################
## The GP models:
###########################

##
## Model fitting
##

# Read data 
data(NYdata); 

# Define the coordinates
coords<-as.matrix(unique(cbind(DataFit[,2:3])))

# MCMC via Gibbs using default choices
set.seed(11)
post.gp <- GibbsDyn(formula=o8hrmax ~cMAXTMP+WDSP+sp(RH),   
         data=NYdata, coords=coords, scale.transform="SQRT")
print(post.gp)

## End(No test)



