library(SimInf)


### Name: u0_SIR
### Title: Example data to initialize the 'SIR' model
### Aliases: u0_SIR

### ** Examples

## Create an 'SIR' model with 1600 nodes and initialize
## it to run over 4*365 days. Add one infected individual
## to the first node.
u0 <- u0_SIR()
u0$I[1] <- 1
tspan <- seq(from = 1, to = 4*365, by = 1)
model <- SIR(u0     = u0,
             tspan  = tspan,
             events = events_SIR(),
             beta   = 0.16,
             gamma  = 0.01)

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)
plot(result)

## Summarize trajectory
summary(result)



