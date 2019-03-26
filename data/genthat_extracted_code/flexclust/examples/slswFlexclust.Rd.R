library(flexclust)


### Name: slswFlexclust
### Title: Segment Level Stability Within Solution.
### Aliases: slswFlexclust plot,resampleFlexclust,missing-method
###   boxplot,resampleFlexclust-method densityplot,resampleFlexclust-method
###   show,resampleFlexclust-method summary,resampleFlexclust-method
### Keywords: cluster hplot

### ** Examples

data("Nclus")
cl3 <- kcca(Nclus, k = 3)
slsw.cl3 <- slswFlexclust(Nclus, cl3, nsamp = 20)
plot(Nclus, col = clusters(cl3))
plot(slsw.cl3)
densityplot(slsw.cl3)
boxplot(slsw.cl3)



