library(mokken)


### Name: MLcoefH
### Title: Two-level scalability coefficents H
### Aliases: MLcoefH
### Keywords: two-level scalability coefficients

### ** Examples


# Small data example (Koopman et al., 2017)
smallData <- data.frame(Subs = c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3),
                        Xa   = c(0, 0, 1, 0, 1, 1, 1, 2, 1, 0, 1, 2, 0, 0, 0), 
                        Xb   = c(0, 0, 1, 0, 2, 2, 2, 1, 2, 1, 2, 2, 1, 1, 0))

MLcoefH(smallData)

# Load real data example (Koopman et al., 2017)
data(autonomySupport)

# Compute scalability coefficients with or without standard errors and nice output
## No test: 
          
H.se.nice <- MLcoefH(autonomySupport)
H.se.nice 
## End(No test)
## No test: 
          
H.se.not  <- MLcoefH(autonomySupport, nice.output = FALSE)
H.se.not  
## End(No test)

## No test: 
          
H.nice    <- MLcoefH(autonomySupport, se = FALSE)
H.nice    
## End(No test)

## No test: 
          
H.not     <- MLcoefH(autonomySupport, se = FALSE, nice.output = FALSE)
H.not     
## End(No test)




