library(sirt)


### Name: qmc.nodes
### Title: Calculation of Quasi Monte Carlo Integration Points
### Aliases: qmc.nodes
### Keywords: Quasi Monte Carlo integration

### ** Examples

## some toy examples

# 5 nodes on one dimension
qmc.nodes( snodes=5, ndim=1 )
  ##            [,1]
  ## [1,]  0.0000000
  ## [2,] -0.3863753
  ## [3,]  0.8409238
  ## [4,] -0.8426682
  ## [5,]  0.3850568

# 7 nodes on two dimensions
qmc.nodes( snodes=7, ndim=2 )
  ##             [,1]        [,2]
  ## [1,]  0.00000000 -0.43072730
  ## [2,] -0.38637529  0.79736332
  ## [3,]  0.84092380 -1.73230641
  ## [4,] -0.84266815 -0.03840544
  ## [5,]  0.38505683  1.51466109
  ## [6,] -0.00122394 -0.86704605
  ## [7,]  1.35539115  0.33491073



