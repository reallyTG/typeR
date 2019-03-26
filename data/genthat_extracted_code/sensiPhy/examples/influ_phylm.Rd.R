library(sensiPhy)


### Name: influ_phylm
### Title: Influential species detection - Phylogenetic Linear Regression
### Aliases: influ_phylm

### ** Examples

# Load data:
data(alien)
# run analysis:
influ <- influ_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]], 
data = alien$data)
# To check summary results:
summary(influ)
# Most influential speciesL
influ$influential.species
# Visual diagnostics
sensi_plot(influ)
# You can specify which graph and parameter ("estimate" or "intercept") to print: 
sensi_plot(influ, param = "estimate", graphs = 2)



