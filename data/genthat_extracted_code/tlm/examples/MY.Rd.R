library(tlm)


### Name: MY
### Title: Expected Adjusted Median or Generalized Mean
### Aliases: MY print.MY

### ** Examples

data(feld1)
head(feld1)

# Linear model with log-log transformation, adjusting for variable 'cat':
modcat <- tlm(y = logroom, x = logmattress, z = cat, data = feld1, ypow = 0, xpow = 0)
summary(modcat)

# Geometric mean of the response as a function of the explanatory variable,
# adjusted for 'cat':  
MY(modcat)
MY(modcat, npoints = 3)
# computed at 1st and 3rd quartiles of the explanatory variable:
MY(modcat, x = quantile(feld1$mattress, probs = c(1, 3)/4))

# Mean of the log(response) as a function of the log explanatory variable,
# adjusted for 'cat':  
MY(modcat, space = "transformed")



