library(discretization)


### Name: disc.Topdown
### Title: Top-down discretization
### Aliases: disc.Topdown

### ** Examples

##---- CAIM discretization ----
##----cut-potins
cm=disc.Topdown(iris, method=1)
cm$cutp
##----discretized data matrix
cm$Disc.data

##---- CACC discretization----
disc.Topdown(iris, method=2)

##---- Ameva discretization ----
disc.Topdown(iris, method=3)



