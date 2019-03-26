library(nadiv)


### Name: makeD
### Title: Create the dominance genetic relationship matrix
### Aliases: makeD makeSd makeSd makeD

### ** Examples


  DinvMat <- makeD(Mrode9, parallel = FALSE)$Dinv

  SdinvMat <- makeSd(FG90, heterogametic = "0", parallel = FALSE)$Sdinv
  # Check to make sure getting correct elements
  ## `simPedDFC()` for pedigree with 4 unique sex-linked dominance relatedness values
  uSdx <- unique(makeSd(simPedDFC(3), heterogametic = "M", returnS = FALSE)$Sd@x)
  stopifnot(all(uSdx %in% c(1, 0.5, 3/16, 1/16))) #<-- must match one of these 4




