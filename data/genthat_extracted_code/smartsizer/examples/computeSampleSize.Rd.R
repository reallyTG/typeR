library(smartsizer)


### Name: computeSampleSize
### Title: Compute the Sample Size for a SMART.
### Aliases: computeSampleSize

### ** Examples

  ## No test: 
  V <- rbind(c(1, 0.3, 0.3, 0.3),
             c(0.3, 1, 0.3, 0.3),
             c(0.3, 0.3, 1, 0.3),
             c(0.3, 0.3, 0.3, 1))

  #Compute sample size to achieve power of 80% to exclude EDTRs inferior
  #to the best by 0.3 or more. The first DTR is best and the other
  #three are inferior by 0.2, 0.6, and 0.3
  #The best EDTR is included with probability greater than or equal to 95%.
  computeSampleSize(V,
                    Delta = c(0, 0.2, 0.6, 0.3),
                    min_Delta = 0.3,
                    alpha = 0.05,
                    desired_power = 0.8)
  
## End(No test)



