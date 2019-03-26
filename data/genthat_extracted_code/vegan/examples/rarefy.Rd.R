library(vegan)


### Name: rarefy
### Title: Rarefaction Species Richness
### Aliases: rarefy rrarefy drarefy rarecurve rareslope
### Keywords: univar

### ** Examples

data(BCI)
S <- specnumber(BCI) # observed number of species
(raremax <- min(rowSums(BCI)))
Srare <- rarefy(BCI, raremax)
plot(S, Srare, xlab = "Observed No. of Species", ylab = "Rarefied No. of Species")
abline(0, 1)
rarecurve(BCI, step = 20, sample = raremax, col = "blue", cex = 0.6)



