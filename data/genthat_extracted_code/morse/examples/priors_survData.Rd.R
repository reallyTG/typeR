library(morse)


### Name: priors_survData
### Title: Create a list of scalars giving priors to use in Bayesian
###   inference.
### Aliases: priors_survData

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create a survData object
dat <- survData(cadmium1)

# (3) Create priors for SD model_type
priors_survData(dat, model_type = "SD")

# (4) Create priors for IT model_type
priors_survData(dat, model_type = "IT")




