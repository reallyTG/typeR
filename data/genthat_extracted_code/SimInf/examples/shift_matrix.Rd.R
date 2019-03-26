library(SimInf)


### Name: shift_matrix
### Title: Extract the shift matrix from a 'SimInf_model' object
### Aliases: shift_matrix

### ** Examples

## Create an SIR model
model <- SIR(u0 = data.frame(S = 99, I = 1, R = 0),
             tspan = 1:5, beta = 0.16, gamma = 0.077)

## Extract the shift matrix from the model
shift_matrix(model)



