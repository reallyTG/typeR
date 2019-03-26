library(spTDyn)


### Name: tp
### Title: Defining dynamic time-series coefficients in the formula
### Aliases: tp
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
post.gp <- GibbsDyn(formula=o8hrmax ~cMAXTMP+WDSP+tp(RH),   
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
data(DataFit); 

# Define the coordinates
coords<-as.matrix(unique(cbind(DataFit[,2:3])))

# MCMC via Gibbs using default choices
set.seed(11)
post.gp <- GibbsDyn(formula=o8hrmax ~cMAXTMP+WDSP+tp(RH),   
         data=DataFit, coords=coords, scale.transform="SQRT")
print(post.gp)

##
## End(No test)



