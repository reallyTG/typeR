library(vcd)


### Name: struc_mosaic
### Title: Core-generating Function for Mosaic Plots
### Aliases: struc_mosaic
### Keywords: hplot

### ** Examples

## Titanic data
data("Titanic")
## mosaic plot with large zeros
strucplot(Titanic, core = struc_mosaic(zero_size = 1))



