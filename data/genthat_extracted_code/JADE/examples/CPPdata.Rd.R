library(JADE)


### Name: CPPdata
### Title: Cocktail Party Problem Data
### Aliases: CPPdata
### Keywords: datasets

### ** Examples

## Not run: 
##D # the data was created as follows:
##D library("tuneR")
##D S1 <- readWave(system.file("datafiles/source5.wav", package = "JADE"))
##D S2 <- readWave(system.file("datafiles/source7.wav", package = "JADE"))
##D S3 <- readWave(system.file("datafiles/source9.wav", package = "JADE"))
##D 
##D set.seed(321)
##D NOISE <- noise("white", duration = 50000)
##D S <- cbind(S1@left, S2@left, S3@left, NOISE@left)
##D S <- scale(S, center = FALSE, scale = apply(S, 2, sd))
##D St <- ts(S, start = 0, frequency = 8000)
##D p <- 4
##D A <- matrix(runif(p^2, 0, 1), p, p)
##D A
##D 
##D X <- tcrossprod(St, A)
##D Xt <- as.ts(X)
##D 
##D colnames(X) <- c("Mic1", "Mic2", "Mic3", "Mic4")
##D CPPdata <- as.data.frame(X)
## End(Not run)



