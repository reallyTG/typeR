library(Publish)


### Name: Units
### Title: Add units to data set
### Aliases: Units

### ** Examples

data(Diabetes)
Diabetes <- Units(Diabetes,list(BMI="kg/m^2"))
Units(Diabetes)
Diabetes <- Units(Diabetes,list(bp.1s="mm Hg",bp.2s="mm Hg"))
Units(Diabetes)



