library(pubh)


### Name: mhor
### Title: Mantel-Haenszel odds ratio.
### Aliases: mhor

### ** Examples

data(oswego, package = "epitools")
oswego$ill <- factor(oswego$ill)
oswego$sex <- factor(oswego$sex)
oswego$chocolate.ice.cream <- factor(oswego$chocolate.ice.cream)
mhor(ill ~ sex/chocolate.ice.cream, data = oswego)



