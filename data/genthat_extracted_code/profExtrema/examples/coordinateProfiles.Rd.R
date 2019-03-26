library(profExtrema)


### Name: coordinateProfiles
### Title: Coordinate profiles starting from a kriging model
### Aliases: coordinateProfiles

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

# Compute coordinate profiles on the posterior mean
options_full<-list(multistart=4,heavyReturn=TRUE, Design = replicate(2,seq(0,1,,60)))
init_des<-lhs::maximinLHS(15,2)
options_approx<- list(multistart=4,heavyReturn=TRUE,initDesign=init_des,fullDesignSize=60)
cProfilesMean<-coordinateProfiles(object=kmModel,threshold=threshold,options_full=options_full,
                                  options_approx=options_approx,uq_computations=FALSE,
                                  plot_level=3,plot_options=NULL,CI_const=NULL,return_level=2)
## Not run: 
##D # Coordinate profiles with UQ with approximate profiles
##D plot_options<-list(save=FALSE, titleProf = "Coordinate profiles",
##D                    title2d = "Posterior mean",qq_fill=TRUE)
##D cProfilesUQ<-coordinateProfiles(object=cProfilesMean,threshold=threshold,options_full=options_full,
##D                                   options_approx=options_approx,uq_computations=TRUE,
##D                                   plot_level=3,plot_options=NULL,CI_const=NULL,return_level=2)
##D 
##D # Coordinate profiles with UQ with fully optim profiles
##D options_full_sims<-list(multistart=4,heavyReturn=TRUE, Design = replicate(2,seq(0,1,,60)))
##D cProfilesUQ<-coordinateProfiles(object=cProfilesMean,threshold=threshold,options_full=options_full,
##D                                   options_approx=options_approx,uq_computations=TRUE,
##D                                   plot_level=3,plot_options=NULL,CI_const=NULL,return_level=2,
##D                                   options_full_sims=options_full_sims)
## End(Not run)



