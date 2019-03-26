library(musica)


### Name: decomp
### Title: Decomposition of time-series
### Aliases: decomp

### ** Examples

data(basin_PT)
str(basin_PT)
basin_PT[['obs_ctrl']]
dobs = decomp(basin_PT[['obs_ctrl']], period = c('1 year', '1 month', '1 day'))



