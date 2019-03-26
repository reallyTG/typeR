library(SimInf)


### Name: events_SEIR
### Title: Example data to initialize events for the 'SEIR' model
### Aliases: events_SEIR

### ** Examples

## Create an 'SEIR' model with 1600 nodes and initialize
## it to run over 4*365 days. Add one infected individual
## to the first node.
u0 <- u0_SEIR()
u0$I[1] <- 1
tspan <- seq(from = 1, to = 4*365, by = 1)
model <- SEIR(u0      = u0,
              tspan   = tspan,
              events  = events_SEIR(),
              beta    = 0.16,
              epsilon = 0.25,
              gamma   = 0.01)

## Display the number of individuals affected by each event type
## per day.
plot(events(model))

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)
plot(result)

## Summarize the trajectory. The summary includes the number of
## events by event type.
summary(result)



