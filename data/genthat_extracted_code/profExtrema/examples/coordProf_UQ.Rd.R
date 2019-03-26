library(profExtrema)


### Name: coordProf_UQ
### Title: Coordinate profiles UQ from a kriging model
### Aliases: coordProf_UQ

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

# Compute coordinate profiles UQ starting from GP model
# define simulation options
options_sims<-list(algorithm="B", lower=rep(0,d), upper=rep(1,d),
                   batchsize=80, optimcontrol = list(method="genoud",pop.size=100,print.level=0),
                   integcontrol = list(distrib="sobol",n.points=1000), nsim=150)
# define 1 order approximation options
init_des<-lhs::maximinLHS(15,d)
options_approx<- list(multistart=4,heavyReturn=TRUE,
                      initDesign=init_des,fullDesignSize=100,
                      smoother="1order")
# define plot options
options_plots<-list(save=FALSE, titleProf = "Coordinate profiles",
                    title2d = "Posterior mean",qq_fill=TRUE)
## Not run: 
##D # profile UQ on approximate coordinate profiles
##D cProfiles_UQ<-coordProf_UQ(object = kmModel,threshold = threshold,allResMean = NULL,
##D                             quantiles_uq = c(0.05,0.95),options_approx = options_approx,
##D                             options_full_sims = NULL,options_sims = options_sims,
##D                             options_bound = NULL,plot_level = 3,
##D                             plot_options = options_plots,return_level = 3)
##D # profile UQ on full optim coordinate profiles
##D options_full_sims<-list(multistart=4,heavyReturn=TRUE)
##D cProfiles_UQ_full<-coordProf_UQ(object = cProfiles_UQ,threshold = threshold,allResMean = NULL,
##D                             quantiles_uq = c(0.05,0.95),options_approx = options_approx,
##D                             options_full_sims = options_full_sims,options_sims = options_sims,
##D                             options_bound = NULL,plot_level = 3,
##D                             plot_options = options_plots,return_level = 3)
##D 
##D # profile UQ on full optim coordinate profiles with bound
##D cProfiles_UQ_full_bound<-coordProf_UQ(object = cProfiles_UQ_full,threshold = threshold,
##D                                       allResMean = NULL, quantiles_uq = c(0.05,0.95),
##D                                       options_approx = options_approx,
##D                                       options_full_sims = options_full_sims,
##D                                       options_sims = options_sims,
##D                                       options_bound = list(beta=0.024,alpha=0.05),
##D                                       plot_level = 3, plot_options = options_plots,
##D                                       return_level = 3)
## End(Not run)



