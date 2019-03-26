library(SpATS)


### Name: variogram
### Title: Sample variogram
### Aliases: variogram variogram.SpATS

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20), degree = 3, pord = 2), 
genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
control =  list(tolerance = 1e-03))

# Compute the variogram
var.m0 <- variogram(m0)
# Plot the variogram
plot(var.m0)



