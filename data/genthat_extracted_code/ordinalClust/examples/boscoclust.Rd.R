library(ordinalClust)


### Name: boscoclust
### Title: boscoclust
### Aliases: boscoclust
### Keywords: "ordinal-data" "co-clustering"

### ** Examples

  ## Don't show: 
    data("Msimulated")

    nbSEM=15
    nbSEMburn=10
    nbindmini=1
    init = "kmeans"

    kr=2
    kc=2
    m=3

    res <- boscoclust(x=Msimulated,kr = kr, kc=kc, m=m, nbSEM=nbSEM,
                      nbindmini=nbindmini, nbSEMburn=nbSEMburn, init=init)
  
## End(Don't show)
  ## No test: 
    
  library(ordinalClust)

  # loading the real dataset
  data("dataqol")
  set.seed(5)

  # loading the ordinal data
  M <- as.matrix(dataqol[,2:29])


  # defining different number of categories:
  m=4


  # defining number of row and column clusters
  krow = 5
  kcol = 4

  # configuration for the inference
  nbSEM=50
  nbSEMburn=40
  nbindmini=2
  init = "kmeans"


  # Co-clustering execution
  object <- boscoclust(x=M,kr=krow,kc=kcol,m=m,nbSEM=nbSEM,
            nbSEMburn=nbSEMburn, nbindmini=nbindmini, init=init)

  
## End(No test)
  



