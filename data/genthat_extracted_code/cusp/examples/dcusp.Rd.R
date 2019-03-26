library(cusp)


### Name: dcusp
### Title: Cobb's Cusp Distribution
### Aliases: dcusp rcusp pcusp qcusp
### Keywords: datagen distribution univar

### ** Examples

    # evaluate density and distribution
    dcusp(0,2,3)
    pcusp(0,2,3)
    pcusp(qcusp(0.125,2,3),2,3) # = 0.125
    
    # generate cusp variates
    rcusp(100, 2, 3) 
    
    # generate cusp variates for random normal and splitting factor values
    alpha = runif(20, -3, 3)
    beta =  runif(20, -3, 3)
    Vectorize(rcusp)(1, alpha, beta)



