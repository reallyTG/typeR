library(rcompanion)


### Name: groupwiseHuber
### Title: Groupwise Huber M-estimators and confidence intervals
### Aliases: groupwiseHuber

### ** Examples

### Example with formula notation
data(Catbus)
groupwiseHuber(Steps ~ Teacher + Sex,
               data      = Catbus,
               ci.type = "wald")
               
### Example with variable notation
data(Catbus)
groupwiseHuber(data      = Catbus,
               var       = "Steps",
               group     = c("Teacher", "Sex"),
               ci.type = "wald")
                                      



