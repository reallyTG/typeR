library(adiv)


### Name: Rentropy
### Title: Pavoine et al. (2017) functional or phylogenetic entropy
### Aliases: Rentropy
### Keywords: models

### ** Examples

data(ecomor, package="ade4")
dtaxo <- dist.taxo(ecomor$taxo)
bird.R <- Rentropy(t(ecomor$habitat), dtaxo^2/2)
dotchart(bird.R$diversity, labels = rownames(bird.R))

data(batcomm)
phy <- read.tree(text=batcomm$tre)
dphy <- as.dist(cophenetic(phy))/2
ab <- batcomm$ab[, phy$tip.label]
bat.R <- Rentropy(ab, dphy)
dotchart(bat.R$diversity, labels = rownames(bat.R))



