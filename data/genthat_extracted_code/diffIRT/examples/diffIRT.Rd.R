library(diffIRT)


### Name: diffIRT
### Title: Fitting diffusion IRT models
### Aliases: diffIRT
### Keywords: models multivariate

### ** Examples

## Not run: 
##D  # open extraversion data
##D data(extraversion)
##D x=extraversion[,1:10]
##D rt=extraversion[,11:20]
##D  
##D # fit an unconstrained D-diffusion model
##D res1=diffIRT(rt,x,model="D")          
##D          
##D # fit a model with equal item boundaries, a[i] using the manual setup
##D res2=diffIRT(rt,x,model="D",
##D   constrain=c(rep(1,10),2:11,12:21,22,23)) 
##D 
##D # fit a model with equal item boundaries, a[i] using the preprogrammed setup
##D res2=diffIRT(rt,x,model="D",
##D   constrain="ai.equal") 
##D 
##D # fit a model where all item drift parameters,vi, are fixed to 0. 
##D res3=diffIRT(rt,x,model="D",
##D   constrain=c(1:10,rep(0,10),11:20,21,22),
##D   start=c(rep(NA,10),rep(0,10),rep(NA,10),NA,NA))       
##D 
##D # fit a model without random person boundary parameters. 
##D res3=diffIRT(rt,x,model="D",
##D   constrain=c(1:30,0,31),
##D   start=c(rep(NA,30),0,NA))       
##D 
## End(Not run)



