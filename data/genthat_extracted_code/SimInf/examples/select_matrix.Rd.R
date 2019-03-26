library(SimInf)


### Name: select_matrix
### Title: Extract the select matrix from a 'SimInf_model' object
### Aliases: select_matrix

### ** Examples

## Create an SIR model
model <- SIR(u0 = data.frame(S = 99, I = 1, R = 0),
             tspan = 1:5, beta = 0.16, gamma = 0.077)

## Extract the select matrix from the model
select_matrix(model)



