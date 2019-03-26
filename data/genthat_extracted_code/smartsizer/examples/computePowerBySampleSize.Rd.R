library(smartsizer)


### Name: computePowerBySampleSize
### Title: Compute the Power Over a Grid of Sample Size Values
### Aliases: computePowerBySampleSize

### ** Examples


  ## No test: 
  V <- rbind(c(1, 0.3, 0.3, 0.3),
             c(0.3, 1, 0.3, 0.3),
             c(0.3, 0.3, 1, 0.3),
             c(0.3, 0.3, 0.3, 1))
  computePowerBySampleSize(V,
                           Delta = c(0, 0.2, 0.6, 0.3),
                           min_Delta = 0.3,
                           sample_size_grid = seq(50,300, 50))
  
## End(No test)



