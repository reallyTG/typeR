library(sdcTarget)


### Name: sdcHashingDefinitionClass-class
### Title: Hashing Definition (S4 Class)
### Aliases: initialize,sdcHashingDefinitionClass-method
###   sdcHashingDefinitionClass-class

### ** Examples

new("sdcHashingDefinitionClass")
new("sdcHashingDefinitionClass")
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
new("sdcHashingDefinitionClass", X = my.X)
new("sdcHashingDefinitionClass", X = my.X, na.recode = FALSE)



