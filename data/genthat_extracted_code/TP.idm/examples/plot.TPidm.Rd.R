library(TP.idm)


### Name: plot.TPidm
### Title: Plot method for a TPidm object
### Aliases: plot.TPidm

### ** Examples

data(colonTP)

# create a TPidm object with s = 0, t = "last" (default),
# CI = FALSE and method = "NM" (default):
nm0 <- TPidm(colonTP, s = 0, CI=FALSE)

# plot all possible transitions without CI:
plot(nm0)

# or 
# create a TPidm object with s = 0, t = "last" (default),
# CI = TRUE (default) and method = "AJ":
aj0ci <- TPidm(colonTP, s = 0, method = "AJ")

# plot transitions "1 2" and "1 3" with CI:
plot(aj0ci, chosen.tr = c("1 2", "1 3"))

# create a TPidm object with s = 365, t = 1095, cov = "rx",
# CI = FALSE and method = "NM" (default):
nm365cov <- TPidm(colonTP, s = 365, t = 1095, cov = "rx", CI=FALSE)

# plot transitions "1 2" and "1 3" without CI:
plot(nm365cov, chosen.tr = c("1 2", "1 3"), col=c("blue","red","green"))



