library(marelac)


### Name: diffcoeff
### Title: Molecular Diffusion Coefficients
### Aliases: diffcoeff
### Keywords: utilities

### ** Examples

diffcoeff(S = 15, t = 15)*1e4*3600*24         # cm2/day
diffcoeff(t = 10, species = "O2")             # m2/s
difftemp <- diffcoeff(t = 0:30)[,1:13]
matplot(0:30, difftemp, xlab = "temperature", ylab = "m2/s",
        main = "Molecular/ionic diffusion", type = "l",
        col = 1:13, lty = 1:13)
legend("topleft", ncol = 2, cex = 0.8, title = "mean", 
       col = 1:13, lty = 1:13,
       legend = cbind(names(difftemp),
       format(colMeans(difftemp), digits = 4)))

## vector-valued salinity
select <- c("O2", "CO2", "NH3", "NH4", "NO3")
diffsal <- diffcoeff(S = 0:35, species = select)
matplot(0:35, diffsal, xlab = "salinity", ylab = "m2/s",
         main = "Molecular/ionic diffusion", type = "l",
         col = 1:length(select), lty = 1:length(select))
legend("topleft", ncol = 2, cex = 0.8, title = "mean",
       col = 1:length(select), lty = 1:length(select),
       legend = cbind(select, format(colMeans(diffsal), digits = 4)))

## vector-valued temperature
difftemp <- diffcoeff(S = 1, t=1:20, species = select)
matplot(1:20, difftemp, xlab = "temperature", ylab = "m2/s",
        main = "Molecular/ionic diffusion", type = "l",
        col = 1:length(select), lty = 1:length(select))
legend("topleft", ncol = 2, cex = 0.8, title = "mean",
       col = 1:length(select), lty = 1:length(select),
       legend = cbind(select, format(colMeans(difftemp), digits = 4)))

## combination of S and t
diffsaltemp <- diffcoeff(S = rep(c(1, 35), each = 20), 
                         t = rep(1:20, 2), species = select)
       



