library(intamapInteractive)


### Name: anisotropyChoice
### Title: anisotropyChoice
### Aliases: anisotropyChoice
### Keywords: spatial cluster nonparametric htest

### ** Examples

library(gstat)
data(walker)
object=createIntamapObject(observations=walker)
object=anisotropyChoice(object)

print(summary(object$clusters$index))
print(object$anisPar)



