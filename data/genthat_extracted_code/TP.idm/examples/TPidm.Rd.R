library(TP.idm)


### Name: TPidm
### Title: Transition probabilities for the illness-death model
### Aliases: TPidm
### Keywords: package TPidm

### ** Examples

data(colonTP)

# create a TPidm object with s = 0, t = "last" (default),
# CI = TRUE (default) and method = "AJ":
aj0ci <- TPidm(colonTP, s = 0, method = "AJ")
plot(aj0ci) # plotting all occupation probabilities

#or
# create a TPidm object with s = 365, t = "last" (default),
# CI = FALSE and method = "NM" (default):
nm365 <- TPidm(colonTP, s = 365, CI=FALSE)
summary(nm365) # summarizing the results

# or
# create a TPidm object with cov = "rx":
nm365cov <- TPidm(colonTP, s = 365, t = 1095, cov = "rx", CI=FALSE)
summary(nm365cov) # summarizing the results



