library(SimInf)


### Name: select_matrix<-
### Title: Set the select matrix for a 'SimInf_model' object
### Aliases: select_matrix<-

### ** Examples

## Create an SIR model
model <- SIR(u0 = data.frame(S = 99, I = 1, R = 0),
             tspan = 1:5, beta = 0.16, gamma = 0.077)

## Set the select matrix
select_matrix(model) <- matrix(c(1, 0, 0, 1, 1, 1, 0, 0, 1), nrow = 3)

## Extract the select matrix from the model
select_matrix(model)



