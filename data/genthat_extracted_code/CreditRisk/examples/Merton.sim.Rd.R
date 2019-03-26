library(CreditRisk)


### Name: Merton.sim
### Title: Firm value in Merton's model
### Aliases: Merton.sim

### ** Examples

V <- Merton.sim(V0 = 20, r = 0.05, sigma = 0.2, t = seq(0, 30, by = 0.5), n = 5)
matplot(x = seq(0, 30, by = 0.5), y = V, type = 's', lty = 1, xlab = 'Time',
ylab = 'Firm value trajectories', main = "Trajectories of the firm values in the Merton's model")




