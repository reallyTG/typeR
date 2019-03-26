library(ape)


### Name: compar.gee
### Title: Comparative Analysis with GEEs
### Aliases: compar.gee print.compar.gee drop1.compar.gee
###   predict.compar.gee
### Keywords: regression

### ** Examples

### The example in Phylip 3.5c (originally from Lynch 1991)
### (the same analysis than in help(pic)...)
tr <- "((((Homo:0.21,Pongo:0.21):0.28,Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);"
tree.primates <- read.tree(text = tr)
X <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968)
Y <- c(4.74493, 3.33220, 3.36730, 2.89037, 2.30259)
### Both regressions... the results are quite close to those obtained
### with pic().
compar.gee(X ~ Y, phy = tree.primates)
compar.gee(Y ~ X, phy = tree.primates)
### Now do the GEE regressions through the origin: the results are quite
### different!
compar.gee(X ~ Y - 1, phy = tree.primates)
compar.gee(Y ~ X - 1, phy = tree.primates)



