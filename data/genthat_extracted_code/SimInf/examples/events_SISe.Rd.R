library(SimInf)


### Name: events_SISe
### Title: Example data to initialize events for the 'SISe' model
### Aliases: events_SISe

### ** Examples

## Create an 'SISe' model with 1600 nodes and initialize
## it to run over 4*365 days. Add one infected individual
## to the first node.
u0 <- u0_SISe()
u0$I[1] <- 1
tspan <- seq(from = 1, to = 4*365, by = 1)
model <- SISe(u0 = u0, tspan = tspan, events = events_SISe(),
              phi = 0, upsilon = 1.8e-2, gamma = 0.1, alpha = 1,
              beta_t1 = 1.0e-1, beta_t2 = 1.0e-1, beta_t3 = 1.25e-1,
              beta_t4 = 1.25e-1, end_t1 = 91, end_t2 = 182,
              end_t3 = 273, end_t4 = 365, epsilon = 0)

## Display the number of individuals affected by each event type
## per day.
plot(events(model))

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)

## Summarize the trajectory. The summary includes the number of
## events by event type.
summary(result)



