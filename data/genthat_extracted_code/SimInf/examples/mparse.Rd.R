library(SimInf)


### Name: mparse
### Title: Model parser to define new models to run in 'SimInf'
### Aliases: mparse

### ** Examples

## Not run: 
##D ## Use the model parser to create a 'SimInf_model' object that
##D ## expresses a SIR model, where 'b' is the transmission rate and
##D ## 'g' is the recovery rate.
##D model  <- mparse(transitions = c("S -> b*S*I/(S+I+R) -> I",
##D                                  "I -> g*I -> R"),
##D                  compartments = c("S", "I", "R"),
##D                  gdata = c(b = 0.16, g = 0.077),
##D                  u0 = data.frame(S = 100, I = 1, R = 0),
##D                  tspan = 1:100)
##D 
##D ## Run and plot the result
##D set.seed(22)
##D result <- run(model, threads = 1)
##D plot(result)
## End(Not run)



