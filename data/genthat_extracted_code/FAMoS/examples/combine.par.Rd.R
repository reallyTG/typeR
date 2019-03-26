library(FAMoS)


### Name: combine.par
### Title: Combine Fitted and Non-fitted Parameters
### Aliases: combine.par

### ** Examples

#set parameters, names and default values
fits <- c(p1 = 3, p4 = -2)
par.names <- c("p1", "p2", "p3", "p4", "p5")
defaults <- list(p1 = 4, p2 = 10, p3 = "p1", p4 = 0, p5 = "p4")

#combine the parameters in different ways
combine.par(fit.par = fits, all.names = par.names)
combine.par(fit.par = fits, all.names = par.names, default.val = defaults)




