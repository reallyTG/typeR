library(SpATS)


### Name: controlSpATS
### Title: Used to set various parameters controlling the fitting process
### Aliases: controlSpATS

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

# Default control parameters
m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, 
 data = wheatdata)

# Modified the number of iterations, the tolerance, and the monitoring
m1 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, 
 data = wheatdata, control = list(maxit = 50, tolerance = 1e-06, monitoring = 1))



