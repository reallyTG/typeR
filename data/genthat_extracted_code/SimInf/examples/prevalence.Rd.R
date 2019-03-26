library(SimInf)


### Name: prevalence
### Title: Calculate prevalence from a model object with trajectory data
### Aliases: prevalence

### ** Examples

## Create an 'SIR' model with 6 nodes and initialize
## it to run over 10 days.
u0 <- data.frame(S = 100:105, I = c(0, 1, 0, 2, 0, 3), R = rep(0, 6))
model <- SIR(u0 = u0, tspan = 1:10, beta = 0.16, gamma = 0.077)

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)

## Determine the proportion of infected individuals (cases)
## in the population at the time-points in 'tspan'.
prevalence(result, I~S+I+R)

## Identical result is obtained with the shorthand 'I~.'
prevalence(result, I~.)

## Determine the proportion of nodes with infected individuals at
## the time-points in 'tspan'.
prevalence(result, I~S+I+R, type = "nop")

## Determine the proportion of infected individuals in each node
## at the time-points in 'tspan'.
prevalence(result, I~S+I+R, type = "wnp")



