library(KFAS)


### Name: simulateSSM
### Title: Simulation of a Gaussian State Space Model
### Aliases: simulateSSM

### ** Examples


set.seed(123)
# simulate new observations from the "fitted" model
model <- SSModel(Nile ~ SSMtrend(1, Q = 1469), H = 15099)
# signal conditional on the data i.e. samples from p(theta | y)
# unconditional simulation is not reasonable as the model is nonstationary
signal_sim <- simulateSSM(model, type = "signals", nsim = 10)
# and add unconditional noise term i.e samples from p(epsilon)
epsilon_sim <- simulateSSM(model, type = "epsilon", nsim = 10,
  conditional = FALSE)
observation_sim <- signal_sim + epsilon_sim

ts.plot(observation_sim[,1,], Nile, col = c(rep(2, 10), 1),
  lty = c(rep(2, 10), 1), lwd = c(rep(1, 10), 2))

# fully unconditional simulation:
observation_sim2 <- simulateSSM(model, type = "observations", nsim = 10,
  conditional = FALSE)
ts.plot(observation_sim[,1,], observation_sim2[,1,], Nile,
col = c(rep(2:3, each = 10), 1), lty = c(rep(2, 20), 1),
lwd = c(rep(1, 20), 2))

# illustrating use of antithetics
model <- SSModel(matrix(NA, 100, 1) ~ SSMtrend(1, 1, P1inf = 0), H = 1)

set.seed(123)
sim <- simulateSSM(model, "obs", nsim = 2, antithetics = TRUE)
# first time points
sim[1,,]
# correlation structure between simulations with two antithetics
cor(sim[,1,])

out_NA <- KFS(model, filtering = "none", smoothing = "state")
model["y"] <- sim[, 1, 1]
out_obs <- KFS(model, filtering = "none", smoothing = "state")

set.seed(40216)
# simulate states from the p(alpha | y)
sim_conditional <- simulateSSM(model, nsim = 10, antithetics = TRUE)

# mean of the simulated states is exactly correct due to antithetic variables
mean(sim_conditional[2, 1, ])
out_obs$alpha[2]
# for variances more simulations are needed
var(sim_conditional[2, 1, ])
out_obs$V[2]

set.seed(40216)
# no data, simulations from p(alpha)
sim_unconditional <- simulateSSM(model, nsim = 10, antithetics = TRUE,
  conditional = FALSE)
mean(sim_unconditional[2, 1, ])
out_NA$alpha[2]
var(sim_unconditional[2, 1, ])
out_NA$V[2]

ts.plot(cbind(sim_conditional[,1,1:5], sim_unconditional[,1,1:5]),
  col = rep(c(2,4), each = 5))
lines(out_obs$alpha, lwd=2)




