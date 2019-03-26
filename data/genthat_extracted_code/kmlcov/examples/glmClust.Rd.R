library(kmlcov)


### Name: glmClust
### Title: Clustering longitudinal data
### Aliases: glmClust

### ** Examples

data(artifdata)
res <- glmClust(formula = Y ~ clust(time + time2 + time3) + pop(treatTime),
data = artifdata, ident = 'id', timeVar = 'time', effectVar = 'treatment', nClust = 4)
# the trajectories with indices 0 indicate the ones with a normal treatment, 1 indicate a high dose
# the color indicates the clusters
# the proportions are in the table above the diagram
plot(res)



