library(divDyn)


### Name: tabinate
### Title: Apply function to TAxon/BIN subset of occurrences and iterATE
### Aliases: tabinate

### ** Examples

 data(corals)

# the number of different coordinate pairs in every time slice
  tabinate(corals, bin="stg", FUN=georange, lat="paleolat", 
    lng="paleolng", method="co")
# geographic range (site occupancy) of every taxon in every bin
  tabinate(corals, bin="stg", tax="genus", FUN=georange, 
    lat="paleolat", lng="paleolng", method="co")




