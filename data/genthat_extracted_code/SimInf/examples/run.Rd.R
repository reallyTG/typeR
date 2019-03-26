library(SimInf)


### Name: run
### Title: Run the SimInf stochastic simulation algorithm
### Aliases: run run,SimInf_model-method

### ** Examples

## Create an 'SIR' model with 10 nodes and initialise
## it to run over 100 days.
model <- SIR(u0 = data.frame(S = rep(99, 10),
                             I = rep(1, 10),
                             R = rep(0, 10)),
             tspan = 1:100,
             beta = 0.16,
             gamma = 0.077)

## Run the model and save the result.
result <- run(model, threads = 1)

## Plot the proportion of susceptible, infected and recovered
## individuals.
plot(result)



