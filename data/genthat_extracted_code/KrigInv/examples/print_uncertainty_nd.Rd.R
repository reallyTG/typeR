library(KrigInv)


### Name: print_uncertainty_nd
### Title: Print a measure of uncertainty for functions with dimension d
###   strictly larger than 2.
### Aliases: print_uncertainty_nd

### ** Examples

#print_uncertainty_nd

set.seed(9)
N <- 30 #number of observations
T <- -1 #threshold
testfun <- hartman3
#The hartman3 function is defined over the domain [0,1]^3. 

lower <- rep(0,times=3)
upper <- rep(1,times=3)

#a 30 points initial design
design <- data.frame( matrix(runif(3*N),ncol=3) )
response <- apply(design,1,testfun)

#km object with matern3_2 covariance
#params estimated by ML from the observations
model <- km(formula=~., design = design, 
	response = response,covtype="matern3_2")

## Not run: 
##D print_uncertainty_nd(model=model,T=T,main="average probability of excursion",type="pn",
##D                     option="mean")
##D 
##D print_uncertainty_nd(model=model,T=T,main="maximum probability of excursion",type="pn",
##D                      option="max")
##D 
## End(Not run)



