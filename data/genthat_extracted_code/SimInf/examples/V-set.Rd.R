library(SimInf)


### Name: V<-
### Title: Set a template for where to write the V result matrix
### Aliases: V<-

### ** Examples

## Create an 'SISe' model with 6 nodes and initialize
## it to run over 10 days.
u0 <- data.frame(S = 100:105, I = 1:6)
model <- SISe(u0 = u0, tspan = 1:10, phi = rep(0, 6),
    upsilon = 0.02, gamma = 0.1, alpha = 1, epsilon = 1.1e-5,
    beta_t1 = 0.15, beta_t2 = 0.15, beta_t3 = 0.15, beta_t4 = 0.15,
    end_t1 = 91, end_t2 = 182, end_t3 = 273, end_t4 = 365)

## Run the model
result <- run(model, threads = 1)

## Display the continuous state variable 'phi' for every node at
## each time-point in tspan.
trajectory(result, compartments = "phi")

## Assume we are only interested in nodes '2' and '4' at the
## time-points '3' and '5'
df <- data.frame(time = c(3, 5, 3, 5),
                 node = c(2, 2, 4, 4),
                 phi = c(TRUE, TRUE, TRUE, TRUE))
V(model) <- df
result <- run(model, threads = 1)
trajectory(result, compartments = "phi")

## It is possible to use an empty 'data.frame' to specify
## that no data-points should be recorded for the trajectory.
V(model) <- data.frame()
result <- run(model, threads = 1)
trajectory(result, compartments = "phi")

## Use 'NULL' to reset the model to record data for every node at
## each time-point in tspan.
V(model) <- NULL
result <- run(model, threads = 1)
trajectory(result, compartments = "phi")



