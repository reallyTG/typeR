library(performanceEstimation)


### Name: workflowVariants
### Title: Generate (parameter) variants of a workflow
### Aliases: workflowVariants
### Keywords: models

### ** Examples

## Not run: 
##D ## Generating several variants of the "svm" learner using different
##D ## values of the parameter "cost", under the "umbrella" of a standard
##D ## workflow (i.e. it assumes wf="standardWF")
##D library(e1071)
##D workflowVariants(learner="svm",cost=c(1,2,5,10))
##D 
##D ## variants of a user defined workflow (assumes that function "userWF"
##D ## is defined and "understands" parameters par1 and par2)
##D workflowVariants(wf="userWF",par1=c(0.1,0.4),par2=c(-10,10))
##D 
##D ## Variants of a standard time series workflows (it assumes that it is a
##D ## time series workflow because of the use of the "type" parameter,
##D ## otherwise you could make it explicit by adding wf="timeseriesWF").
##D workflowVariants(learner="svm",type=c("slide","grow"),gamma=c(0.1,0.4))
##D ## or equivalently
##D workflowVariants(wf="timeseriesWF",learner="svm",type=c("slide","grow"),gamma=c(0.1,0.4))
##D 
##D ## allowing that one parameter is not considered for variants generation
##D workflowVariants(wf="userWF",par1=c(0.1,0.4),par2=c(-10,10),as.is="par1")
##D 
##D ## nesting is also allowed!
##D workflowVariants(wf="userWF",
##D                  xpto=list(par1=c(0.1,0.4),d="k",par3=c(1,3)),
##D                  par2=c(-10,10),
##D                  as.is="par1")
## End(Not run)



