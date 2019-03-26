library(psychomix)


### Name: mptmix
### Title: Finite Mixtures of Multinomial Processing Tree Models
### Aliases: mptmix FLXMCmpt
### Keywords: mixture model

### ** Examples


## No test: 
## Data
data("PairClustering", package = "psychotools")
pc <- reshape(PairClustering, timevar = "trial", idvar = "ID",
              direction = "wide")

## Latent-class MPT model (Klauer, 2006)
set.seed(1)
m <- mptmix(as.matrix(pc[-1]) ~ 1, data = pc, k = 1:3,
            spec = mptspec("SR", .replicates = 2))
m1 <- getModel(m, which = "BIC")

## Inspect results
summary(m1)
parameters(m1)
plot(m1)

library(lattice)
xyplot(m1)
## End(No test)




