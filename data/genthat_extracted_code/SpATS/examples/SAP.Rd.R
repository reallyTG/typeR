library(SpATS)


### Name: SAP
### Title: Define a two-dimensional penalised tensor-product of marginal
###   B-Spline basis functions.
### Aliases: SAP

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

# Original anisotropic approach: two smoothing parameters
m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, 
 data = wheatdata, control =  list(tolerance = 1e-03))
summary(m0)

# ANOVA decomposition: four smoothing parameters
## Not run: 
##D m1 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20), ANOVA = TRUE), 
##D  genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
##D  control =  list(tolerance = 1e-03))
##D summary(m1)
## End(Not run)



