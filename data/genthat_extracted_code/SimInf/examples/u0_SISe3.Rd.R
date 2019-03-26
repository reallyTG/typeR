library(SimInf)


### Name: u0_SISe3
### Title: Example data to initialize the 'SISe3' model
### Aliases: u0_SISe3
### Keywords: dataset

### ** Examples

## Create an 'SISe3' model with 1600 nodes and initialize it to
## run over 4*365 days and record data at weekly time-points.

## Load the initial population and add ten infected individuals to
## I_1 in the first node.
u0 <- u0_SISe3
u0$I_1[1] <- 10

## Define 'tspan' to run the simulation over 4*365 and record the
## state of the system at weekly time-points.
tspan <- seq(from = 1, to = 4*365, by = 7)

## Load scheduled events for the population of nodes with births,
## deaths and between-node movements of individuals.
events <- events_SISe3

## Create a 'SISe3' model
model <- SISe3(u0 = u0, tspan = tspan, events = events,
               phi = rep(0, nrow(u0)), upsilon_1 = 1.8e-2,
               upsilon_2 = 1.8e-2, upsilon_3 = 1.8e-2,
               gamma_1 = 0.1, gamma_2 = 0.1, gamma_3 = 0.1,
               alpha = 1, beta_t1 = 1.0e-1, beta_t2 = 1.0e-1,
               beta_t3 = 1.25e-1, beta_t4 = 1.25e-1, end_t1 = 91,
               end_t2 = 182, end_t3 = 273, end_t4 = 365, epsilon = 0)

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)

## Summarize trajectory
summary(result)

## Plot the proportion of nodes with at least one infected
## individual.
plot(prevalence(result, I_1 + I_2 + I_3 ~ ., "nop"), type = "l")



