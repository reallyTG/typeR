library(ddiv)


### Name: IVsteps
### Title: Calculate steps of IV curve
### Aliases: IVsteps

### ** Examples

#this IV curve is of step=1
#load the data provided in the package
data(IV_step1)
IV1 <- data.frame(IV_step1)
result <- IVsteps(IV1$I,IV1$V)
#use the IV curve with step=2
data(IV_step2)
IV2 <- data.frame(IV_step2)
#with plot.option=TRUE, IV curve and steps are ploted
result2 <- IVsteps(IV2$I,IV2$V,plot.option=TRUE)




