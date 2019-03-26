library(TP.idm)


### Name: summary.TPidm
### Title: Summary method for a TPidm object
### Aliases: summary.TPidm

### ** Examples

data(colonTP)
# create a TPidm object with s = 365, t = 1095, cov = "rx",
# CI = FALSE and method = "NM" (default):
nm365cov <- TPidm(colonTP, s = 365, t = 1095, cov = "rx", CI=FALSE)
summary(nm365cov) # summarizing the results



