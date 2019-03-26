library(simFrame)


### Name: accessors
### Title: Accessor and mutator functions for objects
### Aliases: getAdd getAdd-methods getAux getAux-methods setAux
###   setAux-methods getCall getCall-methods getCollect getCollect-methods
###   setCollect setCollect-methods getColnames getColnames-methods
###   setColnames setColnames-methods getContControl getContControl-methods
###   setContControl setContControl-methods getControl getControl-methods
###   getDataControl getDataControl-methods getDesign getDesign-methods
###   setDesign setDesign-methods getDistribution getDistribution-methods
###   setDistribution setDistribution-methods getDots getDots-methods
###   getDots,TwoStageControl-method setDots setDots-methods
###   setDots,TwoStageControl-method getEpsilon getEpsilon-methods
###   setEpsilon setEpsilon-methods getFun getFun-methods
###   getFun,TwoStageControl-method setFun setFun-methods
###   setFun,TwoStageControl-method getGrouping getGrouping-methods
###   setGrouping setGrouping-methods getIndices getIndices-methods
###   getIntoContamination getIntoContamination-methods
###   setIntoContamination setIntoContamination-methods getK getK-methods
###   setK setK-methods getLegend getLegend-methods getNAControl
###   getNAControl-methods setNAControl setNAControl-methods getNArate
###   getNArate-methods setNArate setNArate-methods getNr getNr-methods
###   getNrep getNrep-methods getProb getProb-methods
###   getProb,TwoStageControl-method setProb setProb-methods
###   setProb,TwoStageControl-method getSAE getSAE-methods setSAE
###   setSAE-methods getSampleControl getSampleControl-methods getSeed
###   getSeed-methods getSize getSize-methods
###   getSize,TwoStageControl-method setSize setSize-methods
###   setSize,TwoStageControl-method getSplit getSplit-methods getTarget
###   getTarget-methods setTarget setTarget-methods getValues
###   getValues-methods
### Keywords: classes methods

### ** Examples

nc <- NAControl(NArate = 0.05)
getNArate(nc)

setNArate(nc, c(0.01, 0.03, 0.05, 0.07, 0.09))
getNArate(nc)




