library(ddiv)


### Name: IVExtractResult
### Title: IV feature extraction
### Aliases: IVExtractResult

### ** Examples

#this IV curve is of step=1
#load the data provided in the package
data(IV_step1)
IV1 <- data.frame(IV_step1)
result <- IVExtractResult(IV1,plot.option=FALSE)
#use the IV curve with step=2
data(IV_step2)
IV2 <- data.frame(IV_step2)
#with plot.option=TRUE, IV curve and steps are ploted
result2 <- IVExtractResult(IV2,plot.option=FALSE)
#use the IV curve with step=3
data(IV_step3)
IV3 <- data.frame(IV_step3)
IVExtractResult(IV3,plot.option=FALSE)




