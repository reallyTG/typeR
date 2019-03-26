library(AHMbook)


### Name: playRN
### Title: Function to play Royle-Nichols model
### Aliases: playRN

### ** Examples

## No test: 
# Run a simulation with the default arguments and look at the results:
playRN()

# Execute the function using various settings
playRN(M = 100, J = 3, mean.abundance = 0.1)  # Increasing abundance
playRN(M = 100, J = 3, mean.abundance = 1)
playRN(M = 100, J = 3, mean.abundance = 5)
playRN(M = 100, J = 3, mean.detection = 0.3)  # Increasing detection
playRN(M = 100, J = 3, mean.detection = 0.5)
playRN(M = 100, J = 3, mean.detection = 0.7)
playRN(M = 100, J = 20)                       # More visits
playRN(M = 1000, J = 3)                       # More sites
## End(No test)



