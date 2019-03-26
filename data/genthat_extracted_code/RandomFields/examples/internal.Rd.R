library(RandomFields)


### Name: Internal functions
### Title: Internal functions
### Aliases: rfGenerateModels rfGenerateConstants rfGenerateTest
###   rfGenerateMaths checkExamples StartExample FinalizeExample
###   Dependencies ScreenDevice plotWithCircles showManpages RM_DEFAULT
###   maintainers.machine
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## internal functions: no examples given
## Don't show: 
## Not run: 
##D  ## OK
##D ## check own examples
##D checkExamples(ignore.all=TRUE, halt=!TRUE)
##D 
##D 
##D ### Check the examples of the other packages:
##D dep.packages <- c( #"DSpat","lgcp", "constrainedKriging", "MarkedPointProcess",
##D                   "Geneland", "glmmBUGS", 
##D                   "ProbForecastGOP","geoR",
##D                   "CompRandFld", ## RFsim does not work in version 2.1.18
##D                   "fractaldim", "rpanel", "spatstat")
##D #for (i in dep.packages) library(i, character.only=TRUE)
##D #for (i in dep.packages) install.packages(i)
##D 
##D 
##D not.working <- list()
##D for (.i in 1:length(dep.packages)) {
##D   not.working[[.i]] <-
##D     checkExamples(path=paste("~/TMP/dep.packages", dep.packages[.i], sep="/"),
##D                    package=dep.packages[.i])
##D   Print(.i, not.working); repeat{ if (readline()=="e") break}
##D }
##D 
##D Print(not.working)
## End(Not run)## End(Don't show)

# for (i in dep.packages) cat(maintainer(i), "\n") 
## Don't show: 
FinalizeExample()
## End(Don't show)


