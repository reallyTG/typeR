library(mvdalab)


### Name: XresidualContrib
### Title: Generates the squared prediction error contributions and
###   contribution plot
### Aliases: XresidualContrib

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
XresidualContrib(mod1, ncomp = 2, obs1 = 3)

## Not run: 
##D #PCA Model
##D pc1 <- pcaFit(Penta[, -1], ncomp = 4)
##D XresidualContrib(pc1, ncomp = 3, obs1 = 3)
## End(Not run)



