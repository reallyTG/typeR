library(SimInf)


### Name: gdata<-
### Title: Set a global data parameter for a 'SimInf_model' object
### Aliases: gdata<-

### ** Examples

## Create an SIR model
model <- SIR(u0 = data.frame(S = 99, I = 1, R = 0),
             tspan = 1:5, beta = 0.16, gamma = 0.077)

## Set 'beta' to a new value
gdata(model, "beta") <- 2

## Extract the global data vector that is common to all nodes
gdata(model)



