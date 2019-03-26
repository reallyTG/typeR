library(AHMbook)


### Name: simDCM
### Title: Simulate detection/nondetection data under a general dynamic
###   community (site-occupancy) model
### Aliases: simDCM

### ** Examples

# Simulate a data set with the default arguments and look at the structure of the output:
tmp <- simDCM()
str(tmp)

## No test: 
# Default arguments, without plots
str(data <- simDCM(show.plot = FALSE))
# More examples:
str(data <- simDCM(nspec = 200)) # More species (looks great)
str(data <- simDCM(nspec = 1))   # A single species (ha, works !)
str(data <- simDCM(nsite = 267)) # More sites
str(data <- simDCM(nsite = 1))   # A single site
str(data <- simDCM(nrep = 10))   # More visits
str(data <- simDCM(nyear = 25))  # More years
str(data <- simDCM(nyear = 2))   # Just two years
# str(data <- simDCM(nyear = 1)) # A single year ... crashes

# No species heterogeneity in parameters of initial occupancy
str(data <- simDCM(sig.lpsi1 = 0, sig.beta.lpsi1 = 0))
# No species heterogeneity in parameters of persistence
str(data <- simDCM(sig.lphi = 0, sig.beta.lphi = 0))
# No species heterogeneity in parameters of colonisation
str(data <- simDCM(sig.lgamma = 0, sig.beta.lgamma = 0))
# No species heterogeneity in parameters of detection
str(data <- simDCM(sig.lp = 0, sig.beta.lp = 0))
# No annual variation in rates
str(data <- simDCM(range.mean.phi = c(0.8, 0.8), range.mean.gamma = c(0.3, 0.3),
  range.mean.p = c(0.6, 0.6)))

# Function arguments that lead to much structure (no zero arguments)
str(data <- simDCM(nspec = 200, nsite = 267, nrep = 3, nyear = 25, 
  mean.psi1 = 0.4, sig.lpsi1 = 3, mu.beta.lpsi1 = 1, sig.beta.lpsi1 = 3, 
  range.mean.phi = c(0.5, 1), sig.lphi = 3, mu.beta.lphi = 1, 
  sig.beta.lphi = 3, range.mean.gamma = c(0, 0.5), 
  sig.lgamma = 3, mu.beta.lgamma = -1, sig.beta.lgamma = 3,
  range.mean.p = c(0.1, 0.9), sig.lp = 3, mu.beta.lp = 1, sig.beta.lp = 3,
  range.beta1.season = c(-2, -0.5), range.beta2.season = c(0, 2), 
  range.sd.site = c(0, 0), range.sd.survey = c(0, 0), show.plot = TRUE))

# Not every occurring species will be detected
set.seed(1)
str(data <- simDCM(nspec = 200, nsite = 20, nrep = 2, nyear = 10, 
  mean.psi1 = 0.1, sig.lpsi1 = 5, 
  range.mean.phi = c(0.3, 0.3), sig.lphi = 5, 
  range.mean.gamma = c(0.1, 0.1), sig.lgamma = 5, 
  range.mean.p = c(0.1, 0.1), sig.lp = 5) )

# Pull out data from species 5
ysp5 <- data$y[,,,5]

# Pull out data from year 1
yyr1 <- data$y[,,1,]
## End(No test)



