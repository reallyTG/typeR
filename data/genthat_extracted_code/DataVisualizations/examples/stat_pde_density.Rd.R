library(DataVisualizations)


### Name: stat_pde_density
### Title: Calculate Pareto density estimation for ggplot2 plots
### Aliases: stat_pde_density

### ** Examples

miris <- reshape2::melt(iris)

ggplot2::ggplot(miris, 

mapping = ggplot2::aes_string(y = 'value', x = 'variable')) +

ggplot2::geom_violin(stat = "PDEdensity")



