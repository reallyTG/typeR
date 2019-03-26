library(musica)


### Name: vcompare
### Title: Assess the relations between two decomposed variables
### Aliases: vcompare

### ** Examples

library(ggplot2)
data(basin_PT)
## Not run: 
##D dobs = decomp(basin_PT[['obs_ctrl']])
##D dctrl = decomp(basin_PT[['sim_ctrl']])
##D d = vcompare(x = list(OBS = dobs, CTRL = dctrl), fun = cov)
##D ggplot(d[period!='G1']) +
##D  geom_line(aes(x = TS, y = value, col = factor(sub_period))) +
##D  facet_grid(VARS~ID) +
##D  scale_x_log10()
##D  
## End(Not run)



