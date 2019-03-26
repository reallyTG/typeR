library(babar)


### Name: Bayescompare
### Title: Bayescompare
### Aliases: Bayescompare

### ** Examples

LmH_411.file <- system.file("extdata", "LmH_411.csv", package = "babar")
LmH_411.data <- read.csv(LmH_411.file, header=TRUE, sep =",",
                         na.strings=c("ND","NA"))
M126_50.file <- system.file("extdata", "M126_50.csv", package = "babar")
M126_50.data <- read.csv(M126_50.file, header=TRUE, sep =",",
                         na.strings=c("ND","NA"))

# Get a quick approximation of the evidence/model parameters.
results.linear.short <- Bayescompare(LmH_411.data, M126_50.data, hyp="H1",
                                     model="linear",tol=100, prior.size=25)

# Compute a better estimate of the evidence/model parameters (slow so not
# run as part of the automated examples).
## Not run: 
##D results.linear.full <- Bayescompare(LmH_411.data, M126_50.data, hyp="H1", model="linear")
## End(Not run)





