library(rcompanion)


### Name: groupwiseGeometric
### Title: Groupwise geometric means and confidence intervals
### Aliases: groupwiseGeometric

### ** Examples

### Example with formula notation 
data(Catbus)
groupwiseGeometric(Steps ~ Sex + Teacher,
                   data   = Catbus)

### Example with variable notation                                              
data(Catbus)
groupwiseGeometric(data   = Catbus,
                   var    = "Steps",
                   group  = c("Sex", "Teacher"))
                      



