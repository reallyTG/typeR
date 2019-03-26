library(vegan)


### Name: sppscores
### Title: Add or Replace Species Scores in Distance-Based Ordination
### Aliases: sppscores sppscores<- sppscores<-.dbrda sppscores<-.capscale
###   sppscores<-.metaMDS
### Keywords: multivariate

### ** Examples

data(BCI, BCI.env)
mod <- dbrda(vegdist(BCI) ~ Habitat, BCI.env)
## add species scores
sppscores(mod) <- BCI
## Euclidean distances of BCI differ from used dissimilarity
plot(vegdist(BCI), dist(BCI))
## more linear relationship
plot(vegdist(BCI), dist(sqrt(decostand(BCI, "total"))))
## better species scores
sppscores(mod) <- sqrt(decostand(BCI, "total"))



