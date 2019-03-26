library(lmSupport)


### Name: modelCaseAnalysis
### Title: Provides graphs and/or tests for problematic cases for a linear
###   model
### Aliases: modelCaseAnalysis
### Keywords: regression

### ** Examples

##NOT RUN
##m = lm(FPS~BAC+TA, data=BAC)
##Cases = modelCaseAnalysis(m,'RESIDUALS')
##BAC[Cases$Rownames,]

##modelCaseAnalysis(m,'DFBETAS')
##modelCaseAnalysis(m,'DFBETAS', 'assets')



