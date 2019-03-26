library(musica)


### Name: compare
### Title: Compare decomposed variables
### Aliases: compare

### ** Examples

library(ggplot2)
data(basin_PT)
## Not run: 
##D dobs = decomp(basin_PT[['obs_ctrl']])
##D dctrl = decomp(basin_PT[['sim_ctrl']])
##D dscen = decomp(basin_PT[['sim_scen']])
##D d = compare(x = list(CTRL = dctrl, SCEN = dscen), compare_to = dobs, fun = max)
##D ggplot(d) +
##D  geom_line(aes(x = TS, y = DIF, col = factor(sub_period))) +
##D  facet_grid(variable ~ comp, scale = 'free') +
##D  scale_x_log10()
##D  
## End(Not run)



