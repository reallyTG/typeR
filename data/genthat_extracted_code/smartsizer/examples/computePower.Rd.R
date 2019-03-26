library(smartsizer)


### Name: computePower
### Title: Compute the Power in a SMART
### Aliases: computePower

### ** Examples


  ## No test: 
  V <- rbind(c(1, 0.3, 0.3, 0.3),
             c(0.3, 1, 0.3, 0.3),
             c(0.3, 0.3, 1, 0.3),
             c(0.3, 0.3, 0.3, 1))

  #Compute power to exclude EDTRs inferior to the best by 0.3 or more
  #The first DTR is best and the other three are inferior by 0.2, 0.6, and 0.3
  #The best DTR is included with probability greater than or equal to 95%.
  computePower(V,
               Delta = c(0, 0.2, 0.6, 0.3),
               min_Delta = 0.3,
               sample_size = 200)
  
## End(No test)



