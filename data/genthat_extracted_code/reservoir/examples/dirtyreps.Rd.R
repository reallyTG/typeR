library(reservoir)


### Name: dirtyreps
### Title: Quick and dirty stochastic generation of seasonal streamflow
###   replicates for a single site.
### Aliases: dirtyreps

### ** Examples

Q <- resX$Q_Mm3
replicates <- dirtyreps(Q, reps = 3)
mean(replicates); mean(Q)
sd(replicates); sd(Q)
plot(replicates)



