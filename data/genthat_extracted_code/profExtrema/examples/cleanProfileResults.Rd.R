library(profExtrema)


### Name: cleanProfileResults
### Title: Clean a profile extrema object
### Aliases: cleanProfileResults

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
options_full<-list(multistart=4,heavyReturn=TRUE, Design = replicate(2,seq(0,1,,50)))
init_des<-lhs::maximinLHS(15,2)
options_approx<- list(multistart=4,heavyReturn=TRUE,initDesign=init_des,fullDesignSize=50)
cProfilesMean<-coordinateProfiles(object=kmModel,threshold=threshold,options_full=options_full,
                                  options_approx=options_approx,uq_computations=FALSE,
                                  plot_level=3,plot_options=NULL,CI_const=NULL,return_level=2)

# If we want to run again the computation of approximate coordinate profiles
# we delete that result and run again the coordinate profiles function
cProfiles_full <- cleanProfileResults(cProfilesMean,level=1)
## No test: 
# Coordinate profiles with UQ with approximate profiles
plot_options<-list(save=FALSE, titleProf = "Coordinate profiles",
                   title2d = "Posterior mean",qq_fill=TRUE)
cProfilesUQ<-coordinateProfiles(object=cProfilesMean,threshold=threshold,options_full=options_full,
                                  options_approx=options_approx,uq_computations=TRUE,
                                  plot_level=3,plot_options=NULL,CI_const=NULL,return_level=2)
# If we would like to remove all UQ results
cProf_noUQ <- cleanProfileResults(cProfilesUQ,level=2)

# If we would like to remove the simulations but keep the pilot points
cProf_noSims <- cleanProfileResults(cProfilesUQ,level=3)
# the line above is useful, for example, if we need a more accurate UQ. In that case
# we obtain more simulations with the same pilot points and then combine the results.

## End(No test)



