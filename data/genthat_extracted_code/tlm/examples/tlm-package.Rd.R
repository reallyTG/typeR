library(tlm)


### Name: tlm-package
### Title: Effects under Linear, Logistic and Poisson Regression Models
###   with Transformed Variables
### Aliases: tlm-package
### Keywords: package

### ** Examples

# linear regression model with log-log tansformation:
data(feld1)
head(feld1)
modcat <- tlm(y = logroom, x = logmattress, z = cat, ypow = 0, xpow = 0, data = feld1)

# print and summary:
modcat
summary(modcat)

# plotting the fitted model in the original space:
plot(modcat, xname = "Mattress levels", yname = "room levels")

# plotting the fitted model in the transformed space (and adding the observations):
plot(modcat, xname = "Mattress levels", yname = "room levels", type = "transformed",
     observed = TRUE)

# diagnosis plot for the fitted model:
plot(modcat, type = "diagnosis")

# Expected geometric mean of the response, adjusting for variable 'cat':
MY(modcat)

# Expected mean of the transformed response, adjusting for variable 'cat':
MY(modcat, space = "transformed")

# Information on how to interpret effects:
effectInfo(modcat)

# Summary effect (default effect):
effect(modcat)



