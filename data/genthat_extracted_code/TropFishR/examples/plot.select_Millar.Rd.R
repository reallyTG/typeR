library(TropFishR)


### Name: plot.select_Millar
### Title: Millar's selectivity plot
### Aliases: plot.select_Millar

### ** Examples

data(gillnet)

output <- select_Millar(gillnet, x0 = c(60,4), rel.power = rep(1,8),
   rtype = "norm.loc", plot = FALSE)

plot(output, plotlens = seq(40,90,0.1), deviance_plot = FALSE)




