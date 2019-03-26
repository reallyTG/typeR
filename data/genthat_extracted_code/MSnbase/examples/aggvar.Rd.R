library(MSnbase)


### Name: aggvar
### Title: Identify aggregation outliers
### Aliases: aggvar

### ** Examples

library("pRolocdata")
data(hyperLOPIT2015ms3r1psm)
groupBy <- "Protein.Group.Accessions"
res1 <- aggvar(hyperLOPIT2015ms3r1psm, groupBy, fun = max)
res2 <- aggvar(hyperLOPIT2015ms3r1psm, groupBy, fun = mean)
par(mfrow = c(1, 3))
plot(res1, log = "y", main = "Single outliers (max)")
plot(res2, log = "y", main = "Overall inconsistency (mean)")
plot(res1[, "agg_dist"], res2[, "agg_dist"],
     xlab = "max", ylab = "mean")



