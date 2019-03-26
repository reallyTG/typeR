library(ContaminatedMixt)


### Name: wine
### Title: Wine Data Set
### Aliases: wine
### Keywords: datasets

### ** Examples


data("wine")

group <- wine[, 1]
pairs(wine[, -1], cex = 0.6, pch = c(2, 3, 1)[group], col = c(3, 4, 2)[group], gap = 0,
cex.labels = 0.6)

res3 <- CNmixt(wine[, -1], G = 3, model = "EEE", initialization = "random.post",
  seed = 5, parallel = FALSE)
agree(res3, givgroup = group)
pairs(res3, cex = 0.6, gap = 0, cex.labels = 0.6)




