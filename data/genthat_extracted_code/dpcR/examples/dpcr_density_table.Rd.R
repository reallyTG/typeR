library(dpcR)


### Name: dpcr_density_table
### Title: Calculate Density of Multiple dPCR runs
### Aliases: dpcr_density_table
### Keywords: dplot hplot

### ** Examples

dens <- dpcr_density_table(six_panels)

# create plot using ggplot2
library(ggplot2)

ggplot(dens[["Experiment2.2"]], aes(x = x, y = y)) + 
  geom_line() + 
  geom_area(aes(fill = !(conf_up | conf_low))) +
  scale_y_continuous("Density") +
  scale_fill_discrete("0.95 CI")




