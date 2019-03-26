library(MSEtool)


### Name: plot_composition
### Title: Plot composition data
### Aliases: plot_composition

### ** Examples

## No test: 
data(Red_snapper)
plot_composition(obs = Red_snapper@CAA[1, , ], plot_type = "annual")
plot_composition(obs = Red_snapper@CAA[1, , ], plot_type = "bubble_data")

plot_composition(obs = Red_snapper@CAL[1, , ], plot_type = "annual", Red_snapper@CAL_bins[1:43])
plot_composition(obs = Red_snapper@CAL[1, , ], plot_type = "bubble_data",
CAL_bins = Red_snapper@CAL_bins[1:43])
## End(No test)



