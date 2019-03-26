library(SimInf)


### Name: u0_SEIR
### Title: Example data to initialize the 'SEIR' model
### Aliases: u0_SEIR

### ** Examples

## Create an 'SEIR' model with 1600 nodes and initialize it to
## run over 4*365 days and record data at weekly time-points.
## Add ten infected individuals to the first node.
u0 <- u0_SEIR()
u0$I[1] <- 10
tspan <- seq(from = 1, to = 4*365, by = 7)
model <- SEIR(u0      = u0,
              tspan   = tspan,
              events  = events_SEIR(),
              beta    = 0.16,
              epsilon = 0.25,
              gamma   = 0.01)

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)
plot(result)

## Summarize trajectory
summary(result)



