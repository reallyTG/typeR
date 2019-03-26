library(lolog)


### Name: lolog
### Title: Fits a LOLOG model via Monte Carlo Generalized Method of Moments
### Aliases: lolog

### ** Examples

library(network)
set.seed(1)
data(flo)
flomarriage <- network(flo,directed=FALSE)
flomarriage %v% "wealth" <- c(10,36,27,146,55,44,20,8,42,103,48,49,10,48,32,3)

# A dyad independent model
fit <- lolog(flomarriage ~ edges + nodeCov("wealth"))
summary(fit)

# A dyad dependent model with 2-stars and triangles
fit2 <- lolog(flomarriage ~ edges + nodeCov("wealth") + star(2) + triangles, verbose=FALSE)
summary(fit2)

## Not run: 
##D 
##D # An order dependent model
##D fit3 <- lolog(flomarriage ~ edges + nodeCov("wealth") + preferentialAttachment(),
##D               flomarriage ~ star(2:3), verbose=FALSE)
##D summary(fit3)
##D 
##D # Try something a bit more real
##D data(ukFaculty)
##D 
##D # Delete vertices missing group
##D delete.vertices(ukFaculty, which(is.na(ukFaculty %v% "Group")))
##D 
##D fituk <- lolog(ukFaculty ~ edges() + nodeMatch("GroupC") + nodeCov("GroupC") + triangles + star(2))
##D summary(fituk)
##D plot(fituk$net, vertex.col= ukFaculty %v% "Group" + 2)
##D 
## End(Not run)




