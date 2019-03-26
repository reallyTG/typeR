library(rioja)


### Name: Merge
### Title: Merges two or more data frames on the basis of common column
###   names.
### Aliases: Merge
### Keywords: utilities

### ** Examples

data(RLGH)
data(SWAP)
# Merge RLGH core data with SWAP training set
# Extract species data from datasets
SWAPsp <- SWAP$spec
RLGHsp <- RLGH$spec
# full outer join for joint ordination of both datasets
comb <- Merge(SWAPsp, RLGHsp)

## Not run: 
##D # superimpose core trajectory on ordination plot
##D library(vegan) # decorana
##D ord <- decorana(comb, iweigh=1)
##D par(mfrow=c(1,2))
##D plot(ord, display="sites")
##D sc <- scores(ord, display="sites")
##D sc <- sc[(nrow(SWAPsp)+1):nrow(comb), ]
##D lines(sc, col="red")
##D title("Joint DCA ordination of surface and core")
##D 
##D # Do the same but this time project core passively
##D # Note we cannot use data from the outer join since decorana
##D # will delete taxa only present in the core - the resulting
##D # ordination model will then not match the taxa in the core
##D comb2 <- Merge(SWAPsp, RLGHsp, join="leftouter", split=TRUE)
##D ord2 <- decorana(comb2$SWAPsp, iweigh=1)
##D sc2 <- predict(ord2, comb2$RLGHsp, type="sites")
##D plot(ord2, display="sites")
##D lines(sc2, col="red")
##D title("DCA with core added \"passively\"")
## End(Not run)



