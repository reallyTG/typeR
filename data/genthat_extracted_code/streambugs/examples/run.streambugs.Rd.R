library(streambugs)


### Name: run.streambugs
### Title: Run the streambugs ODE model
### Aliases: run.streambugs

### ** Examples

m <- streambugs.example.model.toy()
# Display inputs: list of perturbed variables with time points and new values
m$inp
# Simluate
res.C.default <- run.streambugs(y.names = m$y.names, times = m$times,
   par = m$par, inp = m$inp, C = TRUE)
# Modify input (halve second perturbation size) and re-simulate
m$inp$Reach3_w[2,2] <- m$inp$Reach3_w[2,2] / 2
m$inp
res.C.modified <- run.streambugs(y.names = m$y.names, times = m$times,
   par = m$par, inp = m$inp, C = TRUE)
# Compare examplary trajectory of organic matter in one of the habitats
var.name <- "Reach3_Hab1_POM1_POM"
plot(m$times,res.C.default$res[, var.name], type="l", col="red")
lines(m$times, res.C.modified$res[, var.name], col="green")




