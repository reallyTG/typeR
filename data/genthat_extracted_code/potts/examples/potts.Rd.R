library(potts)


### Name: potts
### Title: Potts Models
### Aliases: potts potts.raw potts.potts
### Keywords: misc

### ** Examples

ncolor <- as.integer(4)
beta <- log(1 + sqrt(ncolor))
theta <- c(rep(0, ncolor), beta)

nrow <- 100
ncol <- 100
x <- matrix(1, nrow = nrow, ncol = ncol)
foo <- packPotts(x, ncolor)

out <- potts(foo, theta, nbatch = 10)
out$batch
## Not run: image(out$final)



