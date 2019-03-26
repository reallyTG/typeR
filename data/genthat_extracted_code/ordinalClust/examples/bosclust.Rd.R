library(ordinalClust)


### Name: bosclust
### Title: bosclust
### Aliases: bosclust
### Keywords: "ordinal-data" "clustering"

### ** Examples


## No test: 
  library(ordinalClust)
  data("dataqol")
  set.seed(5)

  # loading the ordinal data
  M <- as.matrix(dataqol[,2:29])

  m = 4

  krow = 4

  nbSEM=50
  nbSEMburn=40
  nbindmini=2
  init = "random"


  object <- bosclust(x=M,kr=krow, m=m, nbSEM=nbSEM,
      nbSEMburn=nbSEMburn, nbindmini=nbindmini, init=init)
    
## End(No test)
  



