library(equSA)


### Name: solcov
### Title: Calculate covariance matrix and precision matrix
### Aliases: solcov
### Keywords: solcov

### ** Examples

library(equSA)
data(SR0)
data(SR0_mat)
subSR0 <- SR0[1:10,1:10]
subSR0_mat <- SR0_mat[1:10,1:10]
solcov(subSR0, subSR0_mat) 
      ## Don't show: 
            library(equSA)
            data(SR0)
            data(SR0_mat)
            subSR0 <- SR0[1:10,1:10]
            subSR0_mat <- SR0_mat[1:10,1:10]
            solcov(subSR0, subSR0_mat) 
      
## End(Don't show)
      ## No test: 
           # library(equSA)
           # data(SR0)
           #  data(SR0_mat)
           # solcov(SR0, SR0_mat)
      
## End(No test)



