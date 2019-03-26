library(SimInf)


### Name: shift_matrix<-
### Title: Set the shift matrix for a 'SimInf_model' object
### Aliases: shift_matrix<-

### ** Examples

## Create an SIR model
model <- SIR(u0 = data.frame(S = 99, I = 1, R = 0),
             tspan = 1:5, beta = 0.16, gamma = 0.077)

## Set the shift matrix
shift_matrix(model) <- matrix(c(2, 1, 0), nrow = 3)

## Extract the shift matrix from the model
shift_matrix(model)



