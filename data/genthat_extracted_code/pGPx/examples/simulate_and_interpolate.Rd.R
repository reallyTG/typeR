library(pGPx)


### Name: simulate_and_interpolate
### Title: Simulate and interpolate
### Aliases: simulate_and_interpolate

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
approx.simu <- simulate_and_interpolate(object=kmModel, nsim = 1, simupoints = simu_points,
                                        interpolatepoints = as.matrix(nn_data),
                                        nugget.sim = 0, type = "UK")
## No test: 
## Plot the approximate process realization
image(matrix(approx.simu[1,],ncol=50),
      col=grey.colors(20))
contour(matrix(approx.simu[1,],ncol=50),
        nlevels = 20,add=TRUE)

## End(No test)



