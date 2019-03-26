library(turfR)


### Name: turf.combos
### Title: Combination sets used in TURF analysis
### Aliases: turf.combos

### ** Examples

  ##Example 1
  ##Generate all combinations of 3, 4, 5 and 6 items drawn from 10 items.
  ex1 <- turf.combos(10, 3:6)
  colSums(ex1[[2]])
 
  ##Example 2
  ##Pass additional arguments
  data(turf_ex_data)
  psims <- colSums(turf_ex_data[,-c(1:2)]) / sum(turf_ex_data[,2])
  psims <- psims / sum(psims)
  ex2 <- turf.combos(10, 4, mc=TRUE, nsims=100, psims=psims)
  colSums(ex2[[1]])  
  



