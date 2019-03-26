library(taxize)


### Name: itis_downstream
### Title: Retrieve all taxa names or TSNs downstream in hierarchy from
###   given TSN.
### Aliases: itis_downstream

### ** Examples

## Not run: 
##D ## the plant class Bangiophyceae, tsn 846509
##D itis_downstream(tsns = 846509, downto="genus")
##D itis_downstream(tsns = 846509, downto="genus", intermediate=TRUE)
##D 
##D # get families downstream from Acridoidea
##D itis_downstream(tsns = 650497, "family")
##D ## here, intermediate leads to the same result as the target
##D itis_downstream(tsns = 650497, "family", intermediate=TRUE)
##D 
##D # get species downstream from Ursus
##D itis_downstream(tsns = 180541, "species")
##D 
##D # get orders down from the Division Rhodophyta (red algae)
##D itis_downstream(tsns = 660046, "order")
##D itis_downstream(tsns = 660046, "order", intermediate=TRUE)
##D 
##D # get tribes down from the family Apidae
##D itis_downstream(tsns = 154394, downto="tribe")
##D itis_downstream(tsns = 154394, downto="tribe", intermediate=TRUE)
## End(Not run)



