library(surveillance)


### Name: toLatex.sts
### Title: 'toLatex'-Method for '"sts"' Objects
### Aliases: toLatex.sts toLatex,sts-method
### Keywords: print

### ** Examples

# Create a test object
data("salmonella.agona")

# Create the corresponding sts object from the old disProg object
salm <- disProg2sts(salmonella.agona)

control <- list(range=(260:312),
                noPeriods=1,populationOffset=FALSE,
                fitFun="algo.farrington.fitGLM.flexible",
                b=4,w=3,weightsThreshold=1,
                pastWeeksNotIncluded=3,
                pThresholdTrend=0.05,trend=TRUE,
                thresholdMethod="delta",alpha=0.1)
salm <- farringtonFlexible(salm,control=control)
print(toLatex(salm))



