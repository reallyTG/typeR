library(bayesplot)


### Name: PPC-scatterplots
### Title: PPC scatterplots
### Aliases: PPC-scatterplots ppc_scatter ppc_scatter_avg
###   ppc_scatter_avg_grouped

### ** Examples

y <- example_y_data()
yrep <- example_yrep_draws()
p1 <- ppc_scatter_avg(y, yrep)
p1
p2 <- ppc_scatter(y, yrep[20:23, ], alpha = 0.5, size = 1.5)
p2

# give x and y axes the same limits
lims <- ggplot2::lims(x = c(0, 160), y = c(0, 160))
p1 + lims
p2 + lims

group <- example_group_data()
ppc_scatter_avg_grouped(y, yrep, group, alpha = 0.7) + lims




