library(synlik)


### Name: blow_sl
### Title: Blowfly model
### Aliases: blowStats blow_sl blow_smcmc

### ** Examples

data(blow_sl)

plot(blow_sl)
simulate(blow_sl, stats = TRUE)

slik(blow_sl, 
     param  = log( c( "delta" = 0.16, "P" = 6.5, "N0" = 400, 
                      "var.p" = 0.1, "tau" = 14, "var.d" = 0.1)  ),
     nsim    = 1e3)

# Using Nicholson's data
data(bf1)

plot(blow_sl)

blow_sl@data <- bf1$pop
blow_sl@extraArgs$obsData <- bf1$pop #Important: blow_sl@blowStats uses the observed data

slik(blow_sl, 
     param  = log( c( "delta" = 0.16, "P" = 6.5, "N0" = 400, 
                      "var.p" = 0.1, "tau" = 14, "var.d" = 0.1)  ),
     nsim    = 1e3)



