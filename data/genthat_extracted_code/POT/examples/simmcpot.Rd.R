library(POT)


### Name: simmcpot
### Title: Simulate an Markov Chain with a Fixed Extreme Value Dependence
###   from a Fitted mcpot Object
### Aliases: simmcpot
### Keywords: models

### ** Examples

data(ardieres)
flows <- ardieres[,"obs"]

Mclog <- fitmcgpd(flows, 5)
par(mfrow = c(1,2))
idx <- which(flows <= 5)
flows[idx] <- NA
plot(flows, main = "Ardieres Data")
flowsSynth <- simmcpot(Mclog, main = "Simulated Data")



