library(colocalization)


### Name: plot.colocal
### Title: Making scatter plots for signal proportions before and after
###   d-type or z-type normalization
### Aliases: plot.colocal

### ** Examples

## a simulated 3D example data.
data("twolines")

twolines.results <- nsinc.d(data = twolines, membership = "membership",
                            dim = 3, r.model = "r.med")

plot(twolines.results)



