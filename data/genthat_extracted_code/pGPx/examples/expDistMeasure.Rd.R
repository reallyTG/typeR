library(pGPx)


### Name: expDistMeasure
### Title: Compute expected distance in measure of approximate excursion
###   set
### Aliases: expDistMeasure

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


threshold <- -10

# Obtain simulation point sampling from maximin LHS design
batchsize <- 50
set.seed(1)
mmLHS_simu_points <-  DiceDesign::maximinSA_LHS(DiceDesign::lhsDesign(n=batchsize,
                                                                     dimension = d,
                                                                     seed=1)$design)$design


# Compute expected distance in measure for approximation obtain from random simulation points
EDM_mmLHS <- rep(NA,batchsize)
integcontrol <- list(distrib="sobol",n.points=1000)
integration.param <- KrigInv::integration_design(integcontrol,d=d,
                                        lower=c(0,0),upper=c(1,1),
                                        model=kmModel,T=threshold)
integration.param$alpha <- 0.5
for(i in seq(1,batchsize)){
EDM_mmLHS[i]<-expDistMeasure( mmLHS_simu_points[1:i,],model = kmModel,
                             threshold = threshold,batchsize = i,
                             integration.param = integration.param  )
}

plot(EDM_mmLHS,type='l',main="Expected distance in measure",xlab="batchsize")


## Not run: 
##D # Get optimized simulation points with algorithm B
##D simu_points <- optim_dist_measure(model=kmModel,threshold = threshold,
##D                                   lower = c(0,0),upper = c(1,1),
##D                                   batchsize = batchsize,algorithm = "B")
##D # plot the criterion value
##D plot(1:batchsize,simu_points$value,type='l',main="Criterion value")
##D 
##D # Compute expected distance in measure for approximation obtained from optimized simulation points
##D EDM_optB <- rep(NA,batchsize)
##D for(i in seq(1,batchsize)){
##D   EDM_optB[i]<-expDistMeasure( simu_points$par[1:i,],model = kmModel,threshold = threshold,
##D                                  batchsize = i,integration.param = integration.param  )
##D }
##D plot(EDM_mmLHS,type='l',main="Expected distance in measure",
##D      xlab="batchsize",ylab="EDM",
##D      ylim=range(EDM_mmLHS,EDM_optB))
##D lines(EDM_optB,col=2,lty=2)
##D legend("topright",c("Maximin LHS","B"),lty=c(1,2),col=c(1,2))
##D 
##D # Get optimized simulation points with algorithm A
##D simu_pointsA <- optim_dist_measure(model=kmModel,threshold = threshold,
##D                                    lower = c(0,0),upper = c(1,1),
##D                                    batchsize = batchsize,algorithm = "A")
##D # plot the criterion value
##D plot(1:batchsize,simu_pointsA$value,type='l',main="Criterion value")
##D 
##D # Compute expected distance in measure for approximation obtained from optimized simulation points
##D EDM_optA <- rep(NA,batchsize)
##D for(i in seq(1,batchsize)){
##D   EDM_optA[i]<-expDistMeasure( simu_pointsA$par[1:i,],model = kmModel,threshold = threshold,
##D                                  batchsize = i,integration.param = integration.param  )
##D }
##D plot(EDM_mmLHS,type='l',main="Expected distance in measure",
##D      xlab="batchsize",ylab="EDM",
##D      ylim=range(EDM_mmLHS,EDM_optB,EDM_optA))
##D lines(EDM_optB,col=2,lty=2)
##D lines(EDM_optA,col=3,lty=3)
##D legend("topright",c("Maximin LHS","A","B"),lty=c(1,3,2),col=c(1,3,2))
##D 
## End(Not run)



