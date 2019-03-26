library(turfR)


### Name: turf
### Title: TURF Analysis for R
### Aliases: turf

### ** Examples

  ##Example 1
  ##Evaluate all combinations of 3, 4, 5 and 6 items drawn from 10 items.
  data(turf_ex_data)
  ex1 <- turf(turf_ex_data, 10, 3:6)
  
  ##Output to Console:
  ##3 of 10: 0.105068 sec
  ##4 of 10: 0.1420949 sec
  ##5 of 10: 0.1511021 sec
  ##6 of 10: 0.1160791 sec
  ##total time elapsed: 0.518347 sec
  
  
  ##Example 2
  ##Pass additional arguments 
  data(turf_ex_data)
  ex2 <- turf(turf_ex_data, 10, 3:6, depth=2, keep=20, mc=TRUE, nsims=100) 
  
  ##Output to Console:
  ##3 of 10: 0.03802586 sec
  ##4 of 10: 0.03702521 sec
  ##5 of 10: 0.0380249 sec
  ##6 of 10: 0.03802609 sec
  ##total time elapsed: 0.156105 sec 
  
  
  ##Example 3
  ##Customize combos, exclude item 10 from all combinations of size 3
  data(turf_ex_data)
  psims <- colSums(turf_ex_data[,-c(1:2)]) / sum(turf_ex_data[,2])
  psims <- psims / sum(psims)
  combos <- turf.combos(10, 3, mc=TRUE, nsims=100, psims=psims)
  combos[[1]] <- combos[[1]][-which(combos[[1]][,10]==1),]
  ex3 <- turf(turf_ex_data, 10, 3, combos)
  
  ##Output to Console:
  ##3 of 10: 0.02001405 sec
  ##total time elapsed: 0.02001405 sec 
  



