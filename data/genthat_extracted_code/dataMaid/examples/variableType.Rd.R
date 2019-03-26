library(dataMaid)


### Name: variableType
### Title: Summary function for original class
### Aliases: variableType

### ** Examples

 #For standard variables:
   varX <- c(rep(c(1,2,3), each=10))
   class(varX)
   variableType(varX)

 #For smartNum variables:
   smartX <- dataMaid:::smartNum(varX)
   class(smartX)
   variableType(smartX)




