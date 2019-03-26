library(SpATS)


### Name: SpATS
### Title: Spatial analysis of field trials with splines
### Aliases: SpATS

### ** Examples

library(SpATS)
data(wheatdata)
summary(wheatdata)

# Create factor variable for row and columns
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20), degree = 3, pord = 2), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
 control =  list(tolerance = 1e-03))
# Brief summary
m0
# More information: dimensions
summary(m0) # summary(fit.m2, which = "dimensions") 
# More information: variances
summary(m0, which = "variances") 
# More information: all
summary(m0, which = "all") 

# Plot results
plot(m0)
plot(m0, all.in.one = FALSE)

# Variogram
var.m0 <- variogram(m0)
plot(var.m0)



