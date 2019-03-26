library(rrcov3way)


### Name: do3Postprocess
### Title: Postprocessing: renormalization, reflection and reordering;
###   access to some of the components of the model.
### Aliases: do3Postprocess do3Postprocess.default do3Postprocess.parafac
###   do3Postprocess.tucker3 tallArray wideArray tall2wide coordinates
###   coordinates.parafac coordinates.tucker3 weights weights.parafac
###   weights.tucker3 reflect reflect.parafac reflect.tucker3 reorder
###   reorder.parafac reorder.tucker3 is.orthogonal is.orthonormal
### Keywords: array multivariate algebra

### ** Examples

    data(elind)
    x1 <- do3Scale(elind, center=TRUE, scale=TRUE)
    cp <- Parafac(x1, ncomp=3, orth="A")
    cp$B
    cp1 <- do3Postprocess(cp, reflectB=-1)      # change the sign of all components of B
    cp$B
    weights(cp1)
    coordinates(cp1)
    coordinates(cp1, type="principal")



