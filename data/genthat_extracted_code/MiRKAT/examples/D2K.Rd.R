library(MiRKAT)


### Name: D2K
### Title: Construct kernel matrix from distance metric
### Aliases: D2K

### ** Examples

  #############################################################
 require(GUniFrac)
 # Load in data and create a distance metric
 data(throat.tree)
 data(throat.otu.tab)
 unifracs = GUniFrac(throat.otu.tab, throat.tree, alpha = c(1))$unifracs
 D1 = unifracs[,,"d_1"]
 # Function
 K = D2K(D1)



