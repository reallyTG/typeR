library(ddiv)


### Name: IVfeature
### Title: Calculate IV feature from a IV curve
### Aliases: IVfeature

### ** Examples

#this IV curve is of step=1
#if IV curve is of step>1, please use IVsteps to first find the number of
#steps and change points, then apply this function for each steps
#load the data provided in the package
data(IV_step1)
IV1 <- data.frame(IV_step1)
result <- IVfeature(IV1$I,IV1$V,crt=0.2,num=75,crtvalb=0.3)




