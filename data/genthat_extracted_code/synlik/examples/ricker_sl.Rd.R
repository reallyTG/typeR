library(synlik)


### Name: ricker_sl
### Title: Ricker model
### Aliases: rickerStats ricker_sl ricker_smcmc

### ** Examples

data(ricker_sl)

plot(ricker_sl)
simulate(ricker_sl, stats = TRUE)

slik(ricker_sl, 
     param  =  c( logR = 3.8, logSigma = log(0.3), logPhi = log(10) ),
     nsim    = 1e3)

# Using Nicholson's data
data(ricker_smcmc)

plot(ricker_smcmc)




