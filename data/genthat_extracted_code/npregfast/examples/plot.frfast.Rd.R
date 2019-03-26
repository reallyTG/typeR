library(npregfast)


### Name: plot.frfast
### Title: Visualization of 'frfast' objects with the base graphics
### Aliases: plot.frfast

### ** Examples

library(npregfast)
data(barnacle)

# Nonparametric regression without interactions
fit <- frfast(DW ~ RC, data = barnacle, nboot = 100) 
plot(fit)
plot(fit, der = 0)
plot(fit, der = 0, points = FALSE)
plot(fit, der = 1, col = "red", CIcol = "blue")

# Nonparametric regression with interactions
fit2 <- frfast(DW ~ RC : F, data = barnacle, nboot = 100) 
plot(fit2)
plot(fit2, der = 0, fac = "lens")
plot(fit2, der = 1, col = "grey", CIcol = "red")
plot(fit2, der = c(0,1), fac = c("barca","lens"))

# Visualization of the differences between two factor's levels
plot(fit2, fac = "barca", diffwith = "lens")
plot(fit2, fac = "barca", diffwith = "lens", der = 1)





