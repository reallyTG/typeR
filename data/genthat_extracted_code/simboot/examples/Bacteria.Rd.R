library(simboot)


### Name: Bacteria
### Title: Relative Abundances of Soil Bacteria
### Aliases: Bacteria
### Keywords: datasets

### ** Examples

data(Bacteria)
str(Bacteria)

### Assess whether there is a difference in biodiversity and
### community composition species richness (Shannon index,
### Simpson index) between grassland and forest. 
### Bootstrap times set to 50 due to example time settings

library(simboot)
mcpHill(dataf=Bacteria[,2:24], fact=Bacteria[,1], boots=50, qval=c(0,1,2))



