library(phyclust)


### Name: phyclust.edist
### Title: Evolution Distance of Sequences
### Aliases: phyclust.edist
### Keywords: programming

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D X <- rbind(c(0, 2, 1, 3, 0, 2, 2, 0, 3, 2, 2),
##D            c(0, 0, 1, 3, 2, 2, 1, 0, 3, 1, 2),
##D            c(0, 2, 1, 1, 0, 2, 1, 3, 0, 0, 1),
##D            c(2, 2, 1, 1, 0, 0, 2, 3, 0, 2, 1),
##D            c(2, 2, 1, 1, 0, 0, 2, 3, 1, 2, 0))
##D (ret <- phyclust.edist(X, edist.model = "D_HAMMING"))
##D str(ret)
##D as.matrix(ret)
##D plot(nj(ret), type = "u", no.margin = TRUE)
## End(Not run)



