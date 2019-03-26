library(EasyMx)


### Name: emxTwinModel
### Title: Creates behavior genetics Twin Model
### Aliases: emxTwinModel emxModelTwin

### ** Examples

   
# Create an ACE model in 10 lines
# 8 of those are data handling.
# 2 are the actual model.
require(EasyMx)
require(OpenMx)
data(twinData)
twinVar = names(twinData)
selVars <- c('ht1', 'bmi1','ht2','bmi2')
mzdzData <- subset(twinData, zyg %in% c(1, 3), c(selVars, 'zyg'))
mzdzData$RCoef <- c(1, NA, .5)[mzdzData$zyg]

run3 <- emxTwinModel(model='Cholesky', relatedness='RCoef',
	data=mzdzData, use=selVars, run=TRUE, name='TwCh')





