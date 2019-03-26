library(ordinalClust)


### Name: plot
### Title: plot
### Aliases: plot
### Keywords: "ordinal-data" "co-clustering"

### ** Examples

## Don't show: 

    data("Msimulated")

    nbSEM=15
    nbSEMburn=10
    nbindmini=1
    init="kmeans"

    kr=2
    kc=2
    m=3

    res <- boscoclust(x=Msimulated,kr = kr,kc=kc,m=m, init=init,
                      nbSEM=nbSEM,nbSEMburn=nbSEMburn,nbindmini=nbindmini)

    plot(res)

  
## End(Don't show)
## No test: 

  data("dataqol")
  set.seed(5)

  # loading the ordinal data 
  M <- as.matrix(dataqol[,2:29])

  m=4

  krow = 4

  nbSEM=50
  nbSEMburn=40
  nbindmini=1

  object <- bosclust(x=M, kr=krow, m=m, nbSEM=nbSEM,
      nbindmini=nbindmini, nbSEMburn=nbSEMburn,
      init='kmeans',disp=TRUE)

  plot(object)
## End(No test)



