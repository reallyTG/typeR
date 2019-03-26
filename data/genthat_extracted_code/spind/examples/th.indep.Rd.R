library(spind)


### Name: th.indep
### Title: Spatial threshold-independent accuracy measures
### Aliases: th.indep

### ** Examples

data(hook)
data <- hook[ ,1:2]
coord <- hook[ ,3:4]
si2 <- th.indep(data, coord, spatial = TRUE)
si2$AUC
si2$TSS
si2$opt.thresh
si2$plot




