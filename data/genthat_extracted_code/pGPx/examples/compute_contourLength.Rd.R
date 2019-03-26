library(pGPx)


### Name: compute_contourLength
### Title: Compute contour lenghts
### Aliases: compute_contourLength

### ** Examples

### Simulate and interpolate for a 2d example
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
simu_points <- DiceDesign::maximinSA_LHS(DiceDesign::lhsDesign(n=100,
                                                               dimension = d,
                                                               seed=1)$design)$design


# obtain nsims posterior realization at simu_points
nsims <- 1
nn_data<-expand.grid(seq(0,1,,50),seq(0,1,,50))
nn_data<-data.frame(nn_data)
colnames(nn_data)<-colnames(kmModel@X)
approx.simu <- simulate_and_interpolate(object=kmModel, nsim = nsims, simupoints = simu_points,
                                        interpolatepoints = as.matrix(nn_data),
                                        nugget.sim = 0, type = "UK")
cLLs<- compute_contourLength(gpRealizations = approx.simu,threshold = -10,
                             nRealizations = nsims,verb = 1)



