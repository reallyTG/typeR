library(apollo)


### Name: apollo_modeloutput
### Title: Prints estimation results to console
### Aliases: apollo_modeloutput

### ** Examples

### Set core controls
apollo_control = list(
  modelName ="MNL", # Make sure to use a new name for every model
  indivID   ="ID",  # Name of column in the database with each individual's ID
  mixing    = FALSE,# TRUE for models that include random parameters
  nCores    = 1     # Number of cores to use in estimation
)

### Load data
data(apollo_modeChoiceData)

### Model parameters
apollo_beta = c(asc_1=0, asc_2=0,
                asc_3=0, asc_4=0,
                tt   =0, tc   =0,
                acc  =0)

### Name of parameters fixed to starting values.
apollo_beta_fixed = c("asc_2")

### Likelihood function (do not change the arguments)
### b contains the parameters, x contains the explanatory variables
apollo_probabilities=function(b, x, functionality="estimate"){
  P <- list() ### Do not delete. Store probabilities here.

  ### Enumerate alternatives and availability, and select choice variable.
  alternatives = c(car=1, bus=2, air=3, rail=4)
  avail        = list(car=x$av_car, bus=x$av_bus, air=x$av_air, rail=x$av_rail)
  choiceVar    = x$choice

  ### List of utilities
  V = list()
  V[['car' ]] = b$asc_1 + b$tt*x$time_car  + b$tc*x$cost_car
  V[['bus' ]] = b$asc_2 + b$tt*x$time_bus  + b$tc*x$cost_bus  + b$acc*x$access_bus
  V[['air' ]] = b$asc_3 + b$tt*x$time_air  + b$tc*x$cost_air  + b$acc*x$access_air
  V[['rail']] = b$asc_4 + b$tt*x$time_rail + b$tc*x$cost_rail + b$acc*x$access_rail

  ### Compute choice probabilities using MNL model
  P[['model']] = apollo_mnl(alternatives, avail, choiceVar, V, functionality)

  return(P)
}

### Estimate model
model = apollo_estimate(apollo_beta, apollo_beta_fixed, database,
                        apollo_probabilities, apollo_control)

### Show output in screen
apollo_modeloutput(model)




