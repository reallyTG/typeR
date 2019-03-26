library(phylolm)


### Name: OUshifts
### Title: Detections of shifts in the OU process along a phylogeny.
### Aliases: OUshifts

### ** Examples

data(flowerSize)
data(flowerTree)
result <- OUshifts(flowerSize$log_transformed_size, flowerTree, 
                   method = "mbic", nmax = 1)
plot.OUshifts(result,show.tip.label=FALSE)



