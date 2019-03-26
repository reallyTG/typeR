library(hyperSpec)


### Name: qplotmixmap
### Title: qplotmap with colour mixing for multivariate overlay
### Aliases: qplotmixmap

### ** Examples

chondro <- chondro - spc.fit.poly.below (chondro)
chondro <- sweep (chondro, 1, apply (chondro, 1, mean), "/")
chondro <- sweep (chondro, 2, apply (chondro, 2, quantile, 0.05), "-")

qplotmixmap (chondro [,,c (940, 1002, 1440)],
             purecol = c (colg = "red", Phe = "green", Lipid = "blue"))




