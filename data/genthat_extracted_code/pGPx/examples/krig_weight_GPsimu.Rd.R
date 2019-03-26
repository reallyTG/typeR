library(pGPx)


### Name: krig_weight_GPsimu
### Title: Weights for interpolating simulations
### Aliases: krig_weight_GPsimu

### ** Examples

######################################################################
### Compute the weights for approximating process on a 1d example
if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
if (!requireNamespace("DiceDesign", quietly = TRUE)) {
stop("DiceDesign needed for this example to work. Please install it.",
     call. = FALSE)
}
## Create kriging model from GP realization
design<-DiceDesign::maximinESE_LHS(design = DiceDesign::lhsDesign(n=20,
                                                                 dimension = 1,
                                                                 seed=42)$design)$design
colnames(design)<-c("x1")
gp0 <- DiceKriging::km (formula = ~1, design = design,
                        response = rep (x = 0, times = nrow (design)),
                        covtype = "matern3_2", coef.trend = 0,
                        coef.var = 1, coef.cov = 0.2)
set.seed(1)
observations <- t (DiceKriging::simulate (object = gp0, newdata = design, cond = FALSE))

# Fit OK km model
kmModel<-DiceKriging::km(formula = ~1,design = design,response = observations,
                         covtype = "matern3_2",control=list(trace=FALSE))

# Get simulation points
# Here they are not optimized, you can use optim_dist_measure to find optimized points
set.seed(2)
simu_points <- matrix(runif(20),ncol=1)
# obtain nsims posterior realization at simu_points
nsims <- 10
set.seed(3)
some.simu <- DiceKriging::simulate(object=kmModel,nsim=nsims,newdata=simu_points,nugget.sim=1e-6,
                         cond=TRUE,checkNames = FALSE)
grid<-seq(0,1,,100)
nn_data<-data.frame(grid)
colnames(nn_data)<-colnames(kmModel@X)
pred_nn<-DiceKriging::predict.km(object = kmModel,newdata = nn_data,type = "UK")
obj <- krig_weight_GPsimu(object=kmModel,simu_points=simu_points,krig_points=grid)

## No test: 
# Plot the posterior mean and some approximate process realizations
result <- matrix(nrow=nsims,ncol=length(grid))

plot(nn_data$x1,pred_nn$mean,type='l')
for(i in 1:nsims){
   some.simu.i <- matrix(some.simu[i,],ncol=1)
   result[i,] <- obj$krig.mean.init + crossprod(obj$Lambda.end,some.simu.i)
   points(simu_points,some.simu.i)
   lines(grid,result[i,],col=3)
}
## End(No test)



