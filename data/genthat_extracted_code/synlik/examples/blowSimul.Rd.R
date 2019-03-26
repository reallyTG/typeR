library(synlik)


### Name: blowSimul
### Title: Simulates from the blowfly model
### Aliases: blowSimul

### ** Examples

tmp <- blowSimul(param = log( c( "delta" = 0.16, "P" = 6.5, "N0" = 400, 
                                 "var.p" = 0.1, "tau" = 14, "var.d" = 0.1)  ), 
                 nsim = 2, 
                 extraArgs = list("nObs" = 200, "nBurn" = 1000, "steps" = 2))
matplot(t(tmp), type = 'l', ylab = "Y", xlab = "Time")



