library(lolog)


### Name: plot.gofit
### Title: Plots a gofit object
### Aliases: plot.gofit

### ** Examples

library(network)
data(ukFaculty)

# Delete vertices missing group
delete.vertices(ukFaculty, which(is.na(ukFaculty %v% "Group")))

# A dyad independent model
fitind <- lolog(ukFaculty ~ edges() + nodeMatch("GroupC") + nodeCov("GroupC"))
summary(fitind)

# Check gof on degree distribution (bad!)
gind <- gofit(fitind, ukFaculty ~ degree(0:50))
plot(gind)
plot(gind, type="box")



