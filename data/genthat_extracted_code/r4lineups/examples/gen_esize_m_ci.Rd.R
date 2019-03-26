library(r4lineups)


### Name: gen_esize_m_ci
### Title: Bootstrapped Confidence Intervals for Effective Size
### Aliases: gen_esize_m_ci

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
k <- 6

#Use gen_boot_samples to get bootstrapped data:
bootdata <- gen_boot_samples(lineup_vec, 1000)

#Compute effective size over df of bootstrapped data:
lineupsizes <- gen_esize_m(bootdata, 6)

#Call:
gen_esize_m_ci(lineupsizes)
gen_esize_m_ci(lineupsizes, perc = .025)
gen_esize_m_ci(lineupsizes, perc = .975)




