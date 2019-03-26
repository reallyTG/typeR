library(SimInf)


### Name: U<-
### Title: Set a template for where to write the U result matrix
### Aliases: U<-

### ** Examples

## Create an 'SIR' model with 6 nodes and initialize it to run over 10 days.
u0 <- data.frame(S = 100:105, I = 1:6, R = rep(0, 6))
model <- SIR(u0 = u0, tspan = 1:10, beta = 0.16, gamma = 0.077)

## Run the model.
result <- run(model, threads = 1)

## Display the trajectory with data for every node at each
## time-point in tspan.
trajectory(result)

## Assume we are only interested in nodes '2' and '4' at the
## time-points '3' and '5'
df <- data.frame(time = c(3, 5, 3, 5),
                 node = c(2, 2, 4, 4),
                 S = c(TRUE, TRUE, TRUE, TRUE),
                 I = c(TRUE, TRUE, TRUE, TRUE),
                 R = c(TRUE, TRUE, TRUE, TRUE))
U(model) <- df
result <- run(model, threads = 1)
trajectory(result)

## We can also specify to record only some of the compartments in
## each time-step.
df <- data.frame(time = c(3, 5, 3, 5),
                 node = c(2, 2, 4, 4),
                 S = c(FALSE, TRUE, TRUE, TRUE),
                 I = c(TRUE, FALSE, TRUE, FALSE),
                 R = c(TRUE, FALSE, TRUE, TRUE))
U(model) <- df
result <- run(model, threads = 1)
trajectory(result)

## It is possible to use an empty 'data.frame' to specify
## that no data-points should be recorded for the trajectory.
U(model) <- data.frame()
result <- run(model, threads = 1)
trajectory(result)

## Use 'NULL' to reset the model to record data for every node at
## each time-point in tspan.
U(model) <- NULL
result <- run(model, threads = 1)
trajectory(result)



