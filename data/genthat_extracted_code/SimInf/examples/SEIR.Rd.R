library(SimInf)


### Name: SEIR
### Title: Create an SEIR model
### Aliases: SEIR

### ** Examples

## Create a SEIR model object.
model <- SEIR(u0 = data.frame(S = 99, E = 0, I = 1, R = 0),
              tspan = 1:100,
              beta = 0.16,
              epsilon = 0.25,
              gamma = 0.077)

## Run the SEIR model and plot the result.
set.seed(3)
result <- run(model)
plot(result)



