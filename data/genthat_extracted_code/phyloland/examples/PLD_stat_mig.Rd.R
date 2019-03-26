library(phyloland)


### Name: PLD_stat_mig
### Title: Dispersal statistics
### Aliases: PLD_stat_mig

### ** Examples

data(Banza)
stat = PLD_stat_mig(x = Banza, sub_sample = 100:200, first = TRUE)
stat$migmat
stat$timemat[,,100]



