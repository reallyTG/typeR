library(ape)


### Name: axisPhylo
### Title: Axis on Side of Phylogeny
### Aliases: axisPhylo
### Keywords: aplot

### ** Examples

tr <- rtree(30)
ch <- rcoal(30)
plot(ch)
axisPhylo()
plot(tr, "c", FALSE, direction = "u")
axisPhylo(2, las = 1)



