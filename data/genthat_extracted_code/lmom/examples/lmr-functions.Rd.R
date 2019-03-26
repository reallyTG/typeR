library(lmom)


### Name: lmr-functions
### Title: L-moments of specific probability distributions
### Aliases: lmr... lmrexp lmrgam lmrgev lmrglo lmrgno lmrgpa lmrgum lmrkap
###   lmrln3 lmrnor lmrpe3 lmrwak lmrwei
### Keywords: distribution

### ** Examples

# Compare sample L-moments of Ozone from the airquality data
# with the L-moments of a GEV distribution fitted to the data
data(airquality)
smom <- samlmu(airquality$Ozone, nmom=6)
gevpar <- pelgev(smom)
pmom <- lmrgev(gevpar, nmom=6)
print(smom)
print(pmom)



