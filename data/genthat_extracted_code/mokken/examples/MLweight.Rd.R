library(mokken)


### Name: MLweight
### Title: Weights for Guttman Errors in two-level test data
### Aliases: MLweight
### Keywords: Weighted Guttman errors, two-level scalability coefficients

### ** Examples

    smallData <- data.frame(Subs = c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3),
                        Xa = c(2, 0, 0, 1, 0, 2, 2, 0, 2, 2, 1, 2, 1, 2, 2), 
                        Xb = c(1, 1, 1, 0, 1, 2, 2, 1, 2, 2, 1, 0, 2, 2, 2), 
                        Xc = c(0, 0, 0, 1, 0, 2, 2, 1, 2, 1, 0, 0, 1, 1, 2))

    # Compute the weights
    I <- 3 
    for(i in 1:(I - 1)) for(j in (i + 1):I) 
     print(MLweight(smallData[, c(1, i + 1, j + 1)], minx = 0, maxx = 2))



