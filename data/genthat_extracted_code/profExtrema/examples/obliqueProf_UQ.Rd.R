library(profExtrema)


### Name: obliqueProf_UQ
### Title: Oblique profiles UQ from a kriging model
### Aliases: obliqueProf_UQ

### ** Examples

if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
# Compute a kriging model from 50 evaluations of the Branin function
# Define the function
g<-function(x){
  return(-branin(x))
}
gp_des<-lhs::maximinLHS(20,2)
reals<-apply(gp_des,1,g)
kmModel<-km(design = gp_des,response = reals,covtype = "matern3_2")

threshold=-10
d<-2

# Compute oblique profiles UQ starting from GP model
# define simulation options
options_sims<-list(algorithm="B", lower=rep(0,d), upper=rep(1,d),
                   batchsize=80, optimcontrol = list(method="genoud",pop.size=100,print.level=0),
                   integcontrol = list(distrib="sobol",n.points=1000), nsim=150)
# define approximation options
options_approx<- list(multistart=4,heavyReturn=TRUE,
                      initDesign=NULL,fullDesignSize=100,
                      smoother=NULL)
# define plot options
options_plots<-list(save=FALSE, titleProf = "Coordinate profiles",
                    title2d = "Posterior mean",qq_fill=TRUE)

# Define the oblique directions
# (for theta=0 it is equal to coordinateProfiles)
theta=pi/4
allPsi = list(Psi1=matrix(c(cos(theta),sin(theta)),ncol=2),
              Psi2=matrix(c(cos(theta+pi/2),sin(theta+pi/2)),ncol=2))
## Not run: 
##D # here we reduce the number of simulations to speed up the example
##D # a higher number should be used
##D options_sims$nsim <- 50
##D 
##D # profile UQ on approximate oblique profiles
##D oProfiles_UQ<-obliqueProf_UQ(object = kmModel,threshold = threshold,allPsi=allPsi,
##D                              allResMean = NULL,quantiles_uq = c(0.05,0.95),
##D                              options_approx = options_approx, options_full_sims = NULL,
##D                              options_sims = options_sims,options_bound = NULL,
##D                              plot_level = 3, plot_options = options_plots,return_level = 3)
##D # profile UQ on full optim oblique profiles
##D 
##D options_full_sims<-list(multistart=4,heavyReturn=TRUE)
##D oProfiles_UQ_full<- obliqueProf_UQ(object = oProfiles_UQ,threshold = threshold,allPsi=allPsi,
##D                              allResMean = NULL,quantiles_uq = c(0.05,0.95),
##D                              options_approx = options_approx, options_full_sims = options_full_sims,
##D                              options_sims = options_sims,options_bound = NULL,
##D                              plot_level = 3, plot_options = options_plots,return_level = 3)
##D 
##D 
##D 
##D # profile UQ on full optim oblique profiles with bound
##D oProfiles_UQ_full_bound<-obliqueProf_UQ(object = oProfiles_UQ_full,threshold = threshold,
##D                                         allPsi=allPsi, allResMean = NULL,
##D                                         quantiles_uq = c(0.05,0.95),
##D                                         options_approx = options_approx,
##D                                         options_full_sims = options_full_sims,
##D                                       options_sims = options_sims,
##D                                       options_bound = list(beta=0.024,alpha=0.05),
##D                                       plot_level = 3, plot_options = options_plots,
##D                                       return_level = 3)
## End(Not run)



