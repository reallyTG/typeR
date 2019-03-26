library(rcompanion)


### Name: cateNelson
### Title: Cate-Nelson models for bivariate data
### Aliases: cateNelson

### ** Examples

data(Nurseries)
cateNelson(x          = Nurseries$Size,
           y          = Nurseries$Proportion,
           plotit     = TRUE,
           hollow     = TRUE,
           xlab       = "Nursery size in hectares",
           ylab       = "Proportion of good practices adopted",
           trend      = "positive",
           clx        = 1,
           xthreshold = 0.10,
           ythreshold = 0.15)




