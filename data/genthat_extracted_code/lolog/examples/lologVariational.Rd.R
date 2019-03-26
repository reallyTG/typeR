library(lolog)


### Name: lologVariational
### Title: Fits a latent ordered network model using Monte Carlo
###   variational inference
### Aliases: lologVariational

### ** Examples

library(network)
data(ukFaculty)

# Delete vertices missing group
delete.vertices(ukFaculty, which(is.na(ukFaculty %v% "Group")))

fit <- lologVariational(ukFaculty ~ edges() + nodeMatch("GroupC"),
                       nReplicates=1L, dyadInclusionRate=1)
summary(fit)





