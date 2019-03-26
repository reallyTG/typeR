library(SimInf)


### Name: boxplot,SimInf_model-method
### Title: Box plot of number of individuals in each compartment
### Aliases: boxplot,SimInf_model-method

### ** Examples

## Create an 'SIR' model with 10 nodes and initialise
## it with 99 susceptible individuals and one infected
## individual. Let the model run over 100 days.
model <- SIR(u0 = data.frame(S = rep(99, 10),
                             I = rep(1, 10),
                             R = rep(0, 10)),
             tspan = 1:100,
             beta = 0.16,
             gamma = 0.077)

## Run the model and save the result.
result <- run(model, threads = 1)

## Create a boxplot
boxplot(result)



