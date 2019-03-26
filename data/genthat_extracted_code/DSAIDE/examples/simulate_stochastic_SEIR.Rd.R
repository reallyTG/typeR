library(DSAIDE)


### Name: simulate_stochastic_SEIR
### Title: Stochastic simulation of an SEIR-type model
### Aliases: simulate_stochastic_SEIR

### ** Examples

# To run the simulation with default parameters, just call the function:
result <- simulate_stochastic_SEIR()
# To choose parameter values other than the standard one, specify them like this:
result <- simulate_stochastic_SEIR(S0 = 2000,  tmax = 200, bE = 1/100)
# You can display or further process the result, like this:
plot(result$ts[,'Time'],result$ts[,'S'],xlab='Time',ylab='Number Susceptible',type='l')
print(paste('Max number of infected: ',max(result$ts[,'I']))) 



