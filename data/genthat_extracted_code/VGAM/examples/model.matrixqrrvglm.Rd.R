library(VGAM)


### Name: model.matrixqrrvglm
### Title: Construct the Model Matrix of a QRR-VGLM Object
### Aliases: model.matrixqrrvglm
### Keywords: models

### ** Examples

## Not run: 
##D set.seed(1); n <- 40; p <- 3; S <- 4; myrank <- 1
##D mydata <- rcqo(n, p, S, Rank = myrank, es.opt = TRUE, eq.max = TRUE)
##D (myform <- attr(mydata, "formula"))
##D mycqo <- cqo(myform, poissonff, data = mydata,
##D              I.tol = TRUE, Rank = myrank, Bestof = 5)
##D model.matrix(mycqo, type = "latvar")
##D model.matrix(mycqo, type = "lm")
##D model.matrix(mycqo, type = "vlm")
## End(Not run)



