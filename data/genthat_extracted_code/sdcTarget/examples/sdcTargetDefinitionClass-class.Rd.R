library(sdcTarget)


### Name: sdcTargetDefinitionClass-class
### Title: S4 Target Definition
### Aliases: initialize,sdcTargetDefinitionClass-method
###   sdcTargetDefinitionClass-class

### ** Examples

new("sdcTargetDefinitionClass")
set.seed(256)
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
new("sdcTargetDefinitionClass", X = my.X)



