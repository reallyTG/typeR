library(lolog)


### Name: gofit.lolog
### Title: Goodness of Fit Diagnostics for a LOLOG fit
### Aliases: gofit.lolog

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
gind
plot(gind)

#check gof on esp distribution (bad!)
gind <- gofit(fitind, ukFaculty ~ esp(0:25))
gind
plot(gind)

## Not run: 
##D 
##D #include triangles and 2-stars (in and out)
##D fitdep <- lolog(ukFaculty ~ edges() + nodeMatch("GroupC") + nodeCov("GroupC") + 
##D                 triangles + star(2, direction="in") + star(2, direction="out"), nsamp=1500)
##D summary(fitdep)
##D 
##D # Check gof on (in + out) degree distribution (good!)
##D gdep <- gofit(fitdep, ukFaculty ~ degree(0:50))
##D gdep
##D plot(gdep)
##D 
##D #check gof on esp distribution (good!)
##D gdep <- gofit(fitdep, ukFaculty ~ esp(0:25))
##D gdep
##D plot(gdep)
##D 
## End(Not run)





