library(arm)


### Name: model.matrixBayes
### Title: Construct Design Matrices
### Aliases: model.matrixBayes
### Keywords: models manip

### ** Examples

ff <- log(Volume) ~ log(Height) + log(Girth)
str(m <- model.frame(ff, trees))
(model.matrix(ff, m))
class(ff) <- c("bayesglm", "terms", "formula")
(model.matrixBayes(ff, m))



