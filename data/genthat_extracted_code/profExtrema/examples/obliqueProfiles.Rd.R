library(profExtrema)


### Name: obliqueProfiles
### Title: Oblique coordinate profiles starting from a kriging model
### Aliases: obliqueProfiles

### ** Examples

if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
# Compute a kriging model from 50 evaluations of the Branin function
# Define the function
g=function(x){
  return(-branin(x))
}
gp_des<-lhs::maximinLHS(20,2)
reals<-apply(gp_des,1,g)
kmModel<-km(design = gp_des,response = reals,covtype = "matern3_2")

threshold=-10

# Compute oblique profiles on the posterior mean
# (for theta=0 it is equal to coordinateProfiles)
options_full<-list(multistart=4,heavyReturn=TRUE,discretization=100)
options_approx<- list(multistart=4,heavyReturn=TRUE,initDesign=NULL,fullDesignSize=100)
theta=pi/4
allPsi = list(Psi1=matrix(c(cos(theta),sin(theta)),ncol=2),
Psi2=matrix(c(cos(theta+pi/2),sin(theta+pi/2)),ncol=2))

## Not run: 
##D profMeans<-obliqueProfiles(object = kmModel,allPsi = allPsi,threshold = threshold,
##D                            options_full = options_full,options_approx = options_approx,
##D                            uq_computations = FALSE,plot_level = 3,plot_options = NULL,
##D                            CI_const = NULL,return_level = 2)
##D 
##D 
##D # Approximate oblique profiles with UQ
##D plot_options<-list(save=FALSE, titleProf = "Coordinate profiles",
##D                    title2d = "Posterior mean",qq_fill=TRUE)
##D options_sims<-list(nsim=150)
##D obProfUQ<-obliqueProfiles(object=profMeans,threshold=threshold,allPsi = allPsi,
##D                            options_full=options_full, options_approx=options_approx,
##D                            uq_computations=TRUE, plot_level=3,plot_options=NULL,
##D                            CI_const=NULL,return_level=2,options_sims=options_sims)
## End(Not run)



