library(csampling)


### Name: mt
### Title: Multivariate Student t Distribution
### Aliases: dmt rmt
### Keywords: distribution

### ** Examples

dmt(c(0.1, -0.4), df = 4, mm = c(1, -1))  
## density of a bivariate t distribution with 4 degrees of freedom 
## and centered at (1,-1)

rmt(n = 100, df = 5, mult = 4)  
## generates 100 replicates of a standard four-variate t distribution 
## with 5 degress of freedom



