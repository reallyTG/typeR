library(pGPx)


### Name: optim_dist_measure
### Title: Choose simulation points
### Aliases: optim_dist_measure

### ** Examples

### Compute optimal simulation points in a 2d example
if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
if (!requireNamespace("DiceDesign", quietly = TRUE)) {
stop("DiceDesign needed for this example to work. Please install it.",
     call. = FALSE)
}
# Define the function
g=function(x){
  return(-DiceKriging::branin(x))
}
d=2
# Fit OK km model
design<-DiceDesign::maximinESE_LHS(design = DiceDesign::lhsDesign(n=20,
                                                                  dimension = 2,
                                                                  seed=42)$design)$design
colnames(design)<-c("x1","x2")
observations<-apply(X = design,MARGIN = 1,FUN = g)
kmModel<-DiceKriging::km(formula = ~1,design = design,response = observations,
                         covtype = "matern3_2",control=list(trace=FALSE))

# Run optim_dist_measure, algorithm B to obtain one simulation point
# NOTE: the approximating process resulting from 1 simulation point
# is very rough and it should not be used, see below for a more principled example.
simu_pointsB <- optim_dist_measure(model=kmModel,threshold = -10,
                                  lower = c(0,0),upper = c(1,1),
                                  batchsize = 1,algorithm = "B")

## Not run: 
##D # Get 75 simulation points with algorithm A
##D batchsize <- 50
##D simu_pointsA <- optim_dist_measure(model=kmModel,threshold = -10,
##D                                   lower = c(0,0),upper = c(1,1),
##D                                   batchsize = batchsize,algorithm = "A")
##D 
##D # Get 75 simulation points with algorithm B
##D batchsize <- 75
##D simu_pointsB <- optim_dist_measure(model=kmModel,threshold = -10,
##D                                   lower = c(0,0),upper = c(1,1),
##D                                   batchsize = batchsize,algorithm = "B")
##D # plot the criterion value
##D critValA <-c(simu_pointsA$value,rep(NA,25))
##D par(mar = c(5,5,2,5))
##D plot(1:batchsize,critValA,type='l',main="Criterion value",ylab="Algorithm A",xlab="batchsize")
##D par(new=T)
##D plot(1:batchsize,simu_pointsB$value, axes=F, xlab=NA, ylab=NA,col=2,lty=2,type='l')
##D axis(side = 4)
##D mtext(side = 4, line = 3, 'Algorithm B')
##D legend("topright",c("Algorithm A","Algorithm B"),lty=c(1,2),col=c(1,2))
##D par(mar= c(5, 4, 4, 2) + 0.1)
##D 
##D # obtain nsims posterior realization at simu_points
##D nsims <- 1
##D nn_data<-expand.grid(seq(0,1,,50),seq(0,1,,50))
##D nn_data<-data.frame(nn_data)
##D colnames(nn_data)<-colnames(kmModel@X)
##D approx.simu <- simulate_and_interpolate(object=kmModel, nsim = 1, simupoints = simu_pointsA$par,
##D                                         interpolatepoints = as.matrix(nn_data),
##D                                         nugget.sim = 0, type = "UK")
##D 
##D ## Plot the approximate process realization
##D image(matrix(approx.simu[1,],ncol=50),
##D       col=grey.colors(20))
##D contour(matrix(approx.simu[1,],ncol=50),
##D         nlevels = 20,add=TRUE)
##D points(simu_pointsA$par,pch=17)
##D points(simu_pointsB$par,pch=1,col=2)
##D 
## End(Not run)



