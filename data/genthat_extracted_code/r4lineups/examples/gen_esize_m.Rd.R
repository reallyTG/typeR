library(r4lineups)


### Name: gen_esize_m
### Title: Effective Size (across a dataframe)
### Aliases: gen_esize_m

### ** Examples

#Data:
lineup_vec <- round(runif(100,1,6))
bootdf <- gen_boot_samples(lineup_vec, 1000)

#Call:
esize_vec <- gen_esize_m(bootdf, 6)




