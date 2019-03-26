library(compositions)


### Name: gsi.PrinBal
### Title: The canonical basis in the clr plane used for ilr and ipt
###   transforms.
### Aliases: gsi.PrinBal
### Keywords: internal

### ** Examples

data("Hydrochem")
x = acomp(Hydrochem[,c(6:10)])
(v1 = gsi.PrinBal(x, "PBhclust"))
(v2 = gsi.PrinBal(x, "PBmaxvar"))
(v3 = gsi.PrinBal(x, "PBangprox"))



