library(colocalization)


### Name: summary.colocal
### Title: Summarizing the colocalization results
### Aliases: summary.colocal

### ** Examples

## a simulated 3D example data.
data("twolines")

twolines.results <- nsinc.d(data = twolines, membership = "membership",
                            dim = 3, r.model = "r.med")

summary(twolines.results)



