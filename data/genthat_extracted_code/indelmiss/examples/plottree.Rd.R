library(indelmiss)


### Name: plottree
### Title: Plot the tree used the branches colored according to the
###   different specified branch groupings (or clades) following unique
###   rates.
### Aliases: plottree

### ** Examples

indel <- indelrates(datasource = "simulation", seed = 1, taxa = 5,
             mu = 1, nu = 5, phyl = 5000,  pmiss = 0, toi = 1, 
             bgtype="ancestornodes", bg = 7, 
             zerocorrection = TRUE, 
             modelnames = c("M1", "M2", "M3", "M4"),
             optmethod = "nlminb")
print(indel)
plottree(indel,colors=c("blue","red"))
ape::tiplabels()



