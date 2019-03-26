library(sensiPhy)


### Name: intra_phylm
### Title: Intraspecific variability - Phylogenetic Linear Regression
### Aliases: intra_phylm

### ** Examples

# Load data:
data(alien)
# run PGLS accounting for intraspecific variation:
intra <- intra_phylm(gestaLen ~ adultMass, y.transf = log, x.transf = log, 
phy = alien$phy[[1]], data = alien$data, Vy = "SD_gesta", n.intra = 30)
# To check summary results:
summary(intra)
# Visual diagnostics
sensi_plot(intra)




