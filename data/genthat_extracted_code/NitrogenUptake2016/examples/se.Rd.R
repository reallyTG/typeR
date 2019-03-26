library(NitrogenUptake2016)


### Name: se
### Title: Calculates standard error
### Aliases: se

### ** Examples

se(CN_mass_data$n_pct)
plyr::ddply(CN_mass_data, plyr::.(species, pool_label), plyr::summarise, se = se(n_pct))



