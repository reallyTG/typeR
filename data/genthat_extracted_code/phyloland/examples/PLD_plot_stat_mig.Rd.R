library(phyloland)


### Name: PLD_plot_stat_mig
### Title: Plot dispersal statistics
### Aliases: PLD_plot_stat_mig

### ** Examples

data(Banza)
stat = PLD_stat_mig(x = Banza, sub_sample = 100:200, first = TRUE)
PLD_plot_stat_mig(timemat = stat$timemat)



