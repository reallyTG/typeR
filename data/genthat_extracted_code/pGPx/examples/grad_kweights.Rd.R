library(pGPx)


### Name: grad_kweights
### Title: Gradient of the weights for interpolating simulations
### Aliases: grad_kweights

### ** Examples

######################################################################
### Compute the weights and gradient on a 2d example
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
design<-DiceDesign::maximinESE_LHS(design = DiceDesign::lhsDesign(n=50,
                                                                  dimension = 2,
                                                                  seed=42)$design)$design
colnames(design)<-c("x1","x2")
observations<-apply(X = design,MARGIN = 1,FUN = g)
kmModel<-DiceKriging::km(formula = ~1,design = design,response = observations,
                         covtype = "matern3_2",control=list(trace=FALSE))
# Get simulation points
# Here they are not optimized, you can use optim_dist_measure to find optimized points
set.seed(1)
simu_points <- matrix(runif(100*d),ncol=d)
# obtain nsims posterior realization at simu_points
nsims <- 1
set.seed(2)
some.simu <- DiceKriging::simulate(object=kmModel,nsim=nsims,newdata=simu_points,nugget.sim=1e-6,
                         cond=TRUE,checkNames = FALSE)
nn_data<-expand.grid(seq(0,1,,50),seq(0,1,,50))
nn_data<-data.frame(nn_data)
colnames(nn_data)<-colnames(kmModel@X)
obj<-krig_weight_GPsimu(object = kmModel,simu_points = simu_points,krig_points = as.matrix(nn_data))

## No test: 
## Plot the approximate process realization and the gradient vector field
k_scale<-5e-4
image(matrix(obj$krig.mean.init+crossprod(obj$Lambda.end,some.simu[1,]),ncol=50),
      col=grey.colors(20))
contour(matrix(obj$krig.mean.init+crossprod(obj$Lambda.end,some.simu[1,]),ncol=50),
        nlevels = 20,add=TRUE)

for(c_ii in c(1,seq(10,2500,by = 64))){
   pp<-t(as.matrix(nn_data)[c_ii,])
   obj_deriv <- grad_kweights(object = kmModel,simu_points = simu_points,krig_points = pp)
   S_der<-obj_deriv$krig.mean.init + crossprod(obj_deriv$Lambda.end,some.simu[1,])
   points(x = pp[1],y = pp[2],pch=16)
   arrows(x0=pp[1],y0=pp[2],x1 = pp[1]+k_scale*S_der[1,1],y1=pp[2]+k_scale*S_der[2,1])
}
## End(No test)



