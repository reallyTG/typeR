library(SimInf)


### Name: nodes
### Title: Example data with spatial distribution of nodes
### Aliases: nodes
### Keywords: dataset

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
             gamma  = 0.077)

## Run the model to generate a single stochastic trajectory.
result <- run(model, threads = 1)

## Determine nodes with one or more infected individuals in the
## trajectory. Extract the 'I' compartment and check for any
## infected individuals in each node.
infected <- colSums(trajectory(result, ~ I, as.is = TRUE)) > 0

## Display infected nodes in 'blue' and non-infected nodes in 'yellow'.
data("nodes", package = "SimInf")
col <- ifelse(infected, "blue", "yellow")
plot(y ~ x, nodes, col = col, pch = 20, cex = 2)



