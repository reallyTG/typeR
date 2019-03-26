library(entropart)


### Name: DivEst
### Title: Diversity Estimation of a metacommunity
### Aliases: DivEst is.DivEst plot.DivEst summary.DivEst

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Estimate Shannon diversity.
Estimation <- DivEst(q = 1, Paracou618.MC, Biased = FALSE, Correction = "UnveilJ", 
Simulations = 20)
plot(Estimation)
summary(Estimation)



