library(synlik)


### Name: rickerSimul
### Title: Simulates from the ricker model
### Aliases: rickerSimul

### ** Examples


tmp <- rickerSimul(c(3.8, -1.2, 2.3), nsim = 2, extraArgs = list("nObs" = 50, "nBurn" = 200))
matplot(t(tmp), type = 'l', ylab = "Y", xlab = "Time")

parMat <- rbind(c(3.8, -1.2, 2.3),  # Chaotic
                c(2.5, -1.2, 2.3))  # Not Chaotic
                
par(mfrow = c(2, 1))
tmp <- rickerSimul(parMat, nsim = 2, extraArgs = list("nObs" = 50, "nBurn" = 200))
plot(tmp[1, ], type = 'l', ylab = "Y", xlab = "Time")
plot(tmp[2, ], type = 'l', ylab = "Y", xlab = "Time")



