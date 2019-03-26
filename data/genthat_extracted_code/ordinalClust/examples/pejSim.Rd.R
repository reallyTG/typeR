library(ordinalClust)


### Name: pejSim
### Title: pejSim
### Aliases: pejSim
### Keywords: "ordinal-data" "clustering"

### ** Examples

  library(ordinalClust)
  data("dataqol")
  set.seed(5)

  m=7
  nr=10000
  mu=5
  pi=0.5

  probaBOS=rep(0,m)
  for (im in 1:m) probaBOS[im]=pejSim(im,m,mu,pi)
  M <- sample(1:m,nr,prob = probaBOS, replace=TRUE)



