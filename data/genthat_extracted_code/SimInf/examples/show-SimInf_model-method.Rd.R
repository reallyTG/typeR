library(SimInf)


### Name: show,SimInf_model-method
### Title: Brief summary of 'SimInf_model'
### Aliases: show,SimInf_model-method

### ** Examples

## Create an 'SIR' model with 10 nodes and initialise
## it to run over 100 days.
model <- SIR(u0 = data.frame(S = rep(99, 10),
                             I = rep(1, 10),
                             R = rep(0, 10)),
             tspan = 1:100,
             beta = 0.16,
             gamma = 0.077)

## Brief summary of the model
model

## Run the model and save the result
result <- run(model, threads = 1)

## Brief summary of the result. Note that 'U' and 'V' are
## non-empty after running the model.
result



