library(phyloland)


### Name: PLD_loc_mrca
### Title: Location of Most Recent Common Ancestor
### Aliases: PLD_loc_mrca

### ** Examples

data(Banza)
locations = PLD_loc_mrca(x = Banza, tips = Banza$tips, sub_sample = 100:200, plot_distrib = TRUE)
locations$frequencies



