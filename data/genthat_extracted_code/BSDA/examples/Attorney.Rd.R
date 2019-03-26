library(BSDA)


### Name: Attorney
### Title: Number of convictions reported by U.S. attorney's offices
### Aliases: Attorney
### Keywords: datasets

### ** Examples


par(mfrow=c(1, 2))
plot(convict ~ staff, data = Attorney, main = "With Washington, D.C.")
plot(convict[-86] ~staff[-86], data = Attorney, 
main = "Without Washington, D.C.")
par(mfrow=c(1, 1))




