library(r4lineups)


### Name: gen_boot_samples
### Title: Bootstrap resampling
### Aliases: gen_boot_samples

### ** Examples

#Data:
lineup_vec <- round(runif(100,1,6))
bootno <- 1000

#Call:
bootdf <- gen_boot_samples(lineup_vec, bootno)




