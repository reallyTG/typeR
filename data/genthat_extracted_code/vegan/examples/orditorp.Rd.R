library(vegan)


### Name: orditorp
### Title: Add Text or Points to Ordination Plots
### Aliases: orditorp
### Keywords: aplot hplot

### ** Examples

## A cluttered ordination plot :
data(BCI)
mod <- cca(BCI)
plot(mod, dis="sp", type="t")
# Now with orditorp and abbreviated species names
cnam <- make.cepnames(names(BCI))
plot(mod, dis="sp", type="n")
stems <- colSums(BCI)
orditorp(mod, "sp", label = cnam, priority=stems, pch="+", pcol="grey")

## show select in action
set.seed(1)
take <- sample(ncol(BCI), 50)
plot(mod, dis="sp", type="n")
stems <- colSums(BCI)
orditorp(mod, "sp", label = cnam, priority=stems, select = take,
         pch="+", pcol="grey")
## Don't show: 
## example(orditorp) should not set random seed in the user session
rm(.Random.seed)
## End(Don't show)



