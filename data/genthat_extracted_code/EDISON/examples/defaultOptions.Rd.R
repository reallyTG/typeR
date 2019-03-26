library(EDISON)


### Name: defaultOptions
### Title: Set the default options for the MCMC simulation.
### Aliases: defaultOptions

### ** Examples


# Set options to allow saving network and changepoint samples to file
options = defaultOptions()
options$save.file = TRUE

# NOT EXECUTED
# result.bino2 = EDISON.run(dataset$sim_data, 
#                  information.sharing='bino_hard',
#                  num.iter=5000, output.file='bino2.results',
#                  options=options)




