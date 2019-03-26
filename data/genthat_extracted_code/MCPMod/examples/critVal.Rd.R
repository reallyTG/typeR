library(MCPMod)


### Name: critVal
### Title: Calculate critical value for multiple contrast test
### Aliases: critVal
### Keywords: htest design

### ** Examples

# Calculation of critical value for Dunnett test
# Set up contrast matrix (3 active doses)
CM <- rbind(-1,diag(3))
# 30 patients per group, one-sided alpha 0.05
critVal(CM, n=30, alpha = 0.05)
# Example from R News 1(2) p. 28, 29
CM <- c(1, 1, 1, 0, 0, -1, 0, 0, 1, 0, 0, -1, 0, 0,
       1, 0, 0, 0, -1, -1, 0, 0, -1, 0, 0)
CM <- t(matrix(CM, ncol = 5))
critVal(CM, n=c(26, 24, 20, 33, 32), alpha = 0.05, 
    twoSide = TRUE)



