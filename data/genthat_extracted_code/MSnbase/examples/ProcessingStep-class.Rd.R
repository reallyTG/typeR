library(MSnbase)


### Name: ProcessingStep-class
### Title: Simple processing step class
### Aliases: ProcessingStep-class ProcessingStep:OnDiskMSnExp
###   ProcessingStep show,ProcessingStep-method executeProcessingStep
### Keywords: classes

### ** Examples

## Define a simple ProcessingStep
procS <- ProcessingStep("sum", list(c(1, 3, NA, 5), na.rm= TRUE))

executeProcessingStep(procS)




