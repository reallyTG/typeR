library(ddalpha)


### Name: depthf.
### Title: Calculate Functional Depth
### Aliases: depthf.
### Keywords: robust functional nonparametric

### ** Examples

# real data example
datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]
                
depthf.(datafA, datafB, notion = "HR")

dataf2A = derivatives.est(datafA,deriv=c(0,1))
dataf2B = derivatives.est(datafB,deriv=c(0,1))

depthf.(dataf2A, dataf2B, notion = "fd2")



