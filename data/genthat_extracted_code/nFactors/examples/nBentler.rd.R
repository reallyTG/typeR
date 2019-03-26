library(nFactors)


### Name: nBentler
### Title: Bentler and Yuan's Procedure to Determine the Number of
###   Components/Factors
### Aliases: nBentler
### Keywords: multivariate

### ** Examples

## ................................................
## SIMPLE EXAMPLE OF THE BENTLER AND YUAN PROCEDURE

# Bentler (1996, p. 309) Table 2 - Example 2 .............
n=649
bentler2<-c(5.785, 3.088, 1.505, 0.582, 0.424, 0.386, 0.360, 0.337, 0.303,
            0.281, 0.246, 0.238, 0.200, 0.160, 0.130)

results  <- nBentler(x=bentler2, N=n)
results

plotuScree(x=bentler2, model="components",
    main=paste(results$nFactors,
    " factors retained by the Bentler and Yuan's procedure (1996, p. 309)",
    sep=""))
# ........................................................

# Bentler (1998, p. 140) Table 3 - Example 1 .............
n        <- 145
example1 <- c(8.135, 2.096, 1.693, 1.502, 1.025, 0.943, 0.901, 0.816, 0.790,
              0.707, 0.639, 0.543,
              0.533, 0.509, 0.478, 0.390, 0.382, 0.340, 0.334, 0.316, 0.297,
              0.268, 0.190, 0.173)
              
results  <- nBentler(x=example1, N=n)
results

plotuScree(x=example1, model="components",
   main=paste(results$nFactors,
   " factors retained by the Bentler and Yuan's procedure (1998, p. 140)",
   sep=""))
# ........................................................
 


