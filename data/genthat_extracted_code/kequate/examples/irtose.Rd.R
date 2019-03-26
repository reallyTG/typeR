library(kequate)


### Name: irtose
### Title: Item Response Theory Observed-Score Kernel Equating
### Aliases: irtose

### ** Examples

## Not run: 
##D #Generate data, non-equivalent groups with chain equating design
##D akX <- runif(15, 0.5, 2)
##D bkX <- rnorm(15)
##D akY <- runif(15, 0.5, 2)
##D bkY <- rnorm(15)
##D akA <- runif(15, 0.5, 2)
##D bkA <- rnorm(15)
##D 
##D dataP <- matrix(0, nrow=1000, ncol=30)
##D dataQ <- matrix(0, nrow=1000, ncol=30)
##D 
##D for(i in 1:1000){
##D 	ability <- rnorm(1)
##D 	dataP[i,1:15] <- (1/(1+exp(-akX*(ability-bkX)) )) > runif(15)
##D 	dataP[i,16:30] <- (1/(1+exp(-akA*(ability-bkA)) )) > runif(15)
##D }
##D 
##D for(i in 1:1000){
##D 	ability <- rnorm(1, mean=0.5)
##D 	dataQ[i,1:15] <- (1/(1+exp(-akY*(ability -bkY)) )) > runif(15)
##D 	dataQ[i,16:30] <- (1/(1+exp(-akA*(ability -bkA)) )) > runif(15)
##D }
##D #Estimate the 2-PL IRT model with package ltm
##D sim2plP <- ltm(dataP ~ z1, IRT.param=TRUE)
##D sim2plQ <- ltm(dataQ ~ z1, IRT.param=TRUE)
##D 
##D #Equate the two tests
##D sim2plan <- irtose("CE", sim2plP, sim2plQ, 0:15, 0:15, 0:15)
## End(Not run)



