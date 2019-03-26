library(sensiPhy)


### Name: samp_phylm
### Title: Sensitivity Analysis Species Sampling - Phylogenetic Linear
###   Regression
### Aliases: samp_phylm

### ** Examples

# Load data:
data(alien)
# Run analysis:
samp <- samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy[[1]], 
data = alien$data, n.sim = 10)
summary(samp)
head(samp$sensi.estimates)
# Visual diagnostics
## Not run: 
##D sensi_plot(samp)
##D # You can specify which graph and parameter ("estimate" or "intercept") to print: 
##D sensi_plot(samp, graphs = 1, param = "estimate")
##D sensi_plot(samp, graphs = 2, param = "intercept")
## End(Not run)



