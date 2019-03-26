library(NMOF)


### Name: CPPI
### Title: Constant-Proportion Portfolio Insurance
### Aliases: CPPI

### ** Examples

tau <- 2
S <- gbm(npaths = 1, timesteps = tau*256,
         r = 0.02, v = 0.2^2, tau = tau, S0 = 100)

## rebalancing every day
sol <- CPPI(S, multiplier = 5, floor = 0.9, r = 0.01,
            tau = tau, gap = 1)
par(mfrow = c(3,1), mar = c(3,3,1,1))
plot(0:(length(S)-1), S,     type = "s", main = "stock price")
plot(0:(length(S)-1), sol$V, type = "s", main = "value")
plot(0:(length(S)-1), 100*sol$E/sol$V, type = "s",
     main = "% invested in risky asset")

## rebalancing every 5th day
sol <- CPPI(S, multiplier = 5, floor = 0.9, r = 0.01,
            tau = tau, gap = 5)
par(mfrow = c(3,1), mar = c(3,3,1,1))
plot(0:(length(S)-1), S,     type = "s", main = "stock price")
plot(0:(length(S)-1), sol$V, type = "s", main = "value")
plot(0:(length(S)-1), 100*sol$E/sol$V, type = "s",
     main = "% invested in risky asset")



