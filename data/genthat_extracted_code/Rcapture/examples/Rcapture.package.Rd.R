library(Rcapture)


### Name: Rcapture-package
### Title: Loglinear Models for Capture-Recapture Experiments
### Aliases: Rcapture-package Rcapture
### Keywords: package

### ** Examples

# Here is an example on the lesbian data set.

data(lesbian)

desc <- descriptive(lesbian, dfreq = TRUE)
desc
plot(desc)

# 1612 out of 2185 individuals (74%) appear on one list only.
# The exploratory heterogeneity graph are not quite linear.
# Some heterogeneity in the units capture probabilities
# seem present in the data set.

closedp(lesbian, dfreq = TRUE)

# According to the BIC, the best model is Mth Darroch.
# Let's see if adding  interactions between capture 
# histories to the model could improve the model's fit.

closedpMS.t(lesbian, dfreq = TRUE, h = "Darroch")

# According to the BIC, the best heterogeneous Darroch model
# contains the double interactions 12, 13, 14. 
# Here is the profile likelihood confidence interval for the
# abundance estimation from this model.

closedpCI.t(lesbian, dfreq = TRUE, mX = "[12,13,14]", h = "Darroch")


####################################################

# Example to illustrate warnings management in closed population functions.

# Here is a capture-recapture data set one could encounter.

crdata <- cbind(histpos.t(4), c(0,0,3,0,0,0,0,0,0,0,0,1,0,0,2))

# This data set contains 4 capture occasions but only 6 captured units.
# Fitting capture-recapture models on this data set is quite useless.
# The population size should be very close to the sample size.

# Such small frequencies in a capture-recapture data set should
# lead to warnings when fitting a loglinear model on it.

ex <- closedp.t(crdata, dfreq=TRUE)
ex

# Many models produce warnings of type 1 indicating that the model fit 
# is questionnable. The very large abundance estimation for some models 
# are another indicator of questionable model fits.
# Details about the warnings are found in the glm.warn element of the output.

ex$glm.warn



