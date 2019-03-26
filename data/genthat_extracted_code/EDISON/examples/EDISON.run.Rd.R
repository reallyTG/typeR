library(EDISON)


### Name: EDISON.run
### Title: Wrapper function for starting an MCMC simulation
### Aliases: EDISON.run

### ** Examples


# Generate random gene network and simulate data from it
dataset = simulateNetwork(l=25)

# Run MCMC simulation to infer networks and changepoint locations
# Uses default settings: Poisson prior and 1500 iterations
result.poisson = EDISON.run(dataset$sim_data, num.iter=500)

# Use the binomial information sharing prior with hard node coupling, and
# run for 5000 iterations

# NOT EXECUTED
#result.bino = EDISON.run(dataset$sim_data, 
#                information.sharing='bino_hard', num.iter=5000)
                        
# Set options to allow saving network and changepoint samples to file
options = defaultOptions()
options$save.file = TRUE

# NOT EXECUTED
# result.bino2 = EDISON.run(dataset$sim_data, 
#                  information.sharing='bino_hard',
#                  num.iter=5000, output.file='bino2.results',
#                  options=options)




