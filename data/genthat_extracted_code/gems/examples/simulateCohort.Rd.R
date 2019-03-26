library(gems)


### Name: simulateCohort
### Title: Simulate cohort
### Aliases: simulateCohort
### Keywords: function main

### ** Examples


# Here is an example model with 3 states and 2 possible transitions. 
 
# number of states in the model
statesNumber <- 3 

# cohort size
cohortSize <- 100

# specification of hazard functions
hazardf <- generateHazardMatrix(statesNumber)
hazardf[[1,2]] <- function(t, r1, r2) 
{
  ifelse(t<=2, r1 , r2)
}
hazardf[[2,3]] <- "Weibull" 

# list of parameters for the hazard functions
mu <- generateParameterMatrix(hazardf) 
mu[[1,2]] <- list(0.33,  0.03) # r1, r2 
mu[[2,3]] <- list(1,0.84) # shape, scale

# time
maxTime <- 10

# simulate the cohort
cohort <- simulateCohort(
  transitionFunctions = hazardf,
  parameters = mu,
  cohortSize = cohortSize,
  to=maxTime)

# output
head(cohort)

# transition probability
tr <- transitionProbabilities(cohort, times=seq(0,4,.1))
plot(tr, ci=FALSE)

# cumulative incidence
inc <- cumulativeIncidence(cohort, times=seq(0,4,.1))
plot(inc, ci=FALSE, states=c(2,3))




