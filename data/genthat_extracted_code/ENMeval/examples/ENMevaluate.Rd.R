library(ENMeval)


### Name: ENMevaluate 
### Title: Tuning and evaluation of ENMs with Maxent
### Aliases: ENMevaluate tuning

### ** Examples

require(raster)

### Simulated data environmental covariates
set.seed(1)
r1 <- raster(matrix(nrow=50, ncol=50, data=runif(10000, 0, 25)))
r2 <- raster(matrix(nrow=50, ncol=50, data=rep(1:100, each=100), byrow=TRUE))
r3 <- raster(matrix(nrow=50, ncol=50, data=rep(1:100, each=100)))
r4 <- raster(matrix(nrow=50, ncol=50, data=c(rep(1,1000),rep(2,500)),byrow=TRUE))
values(r4) <- as.factor(values(r4))
env <- stack(r1,r2,r3,r4)

### Simulate occurrence localities
nocc <- 50
x <- (rpois(nocc, 2) + abs(rnorm(nocc)))/11
y <- runif(nocc, 0, .99)
occ <- cbind(x,y)

## Not run: 
##D ### This call gives the results loaded below
##D enmeval_results <- ENMevaluate(occ, env, method="block", n.bg=500, 
##D                                 categoricals=4, algorithm='maxent.jar')
## End(Not run)

data(enmeval_results)
enmeval_results

### See table of evaluation metrics
enmeval_results@results

### Plot prediction with lowest AICc
plot(enmeval_results@predictions[[which (enmeval_results@results$delta.AICc == 0) ]])
points(enmeval_results@occ.pts, pch=21, bg=enmeval_results@occ.grp)

### Niche overlap statistics between model predictions
enmeval_results@overlap
	



