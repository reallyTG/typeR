library(dbstats)


### Name: plot.dbplsr
### Title: Plots for a dbplsr object
### Aliases: plot.dbplsr

### ** Examples

#require(pls)
library(pls)
data(yarn)
## Default methods:
yarn.dbplsr <- dbplsr(density ~ NIR, data = yarn, ncomp=6, method="GCV")
plot(yarn.dbplsr,scores.comps=1:3)




