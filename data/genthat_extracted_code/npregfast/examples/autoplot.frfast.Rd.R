library(npregfast)


### Name: autoplot.frfast
### Title: Visualization of 'frfast' objects with ggplot2 graphics
### Aliases: autoplot.frfast

### ** Examples


library(npregfast)
library(ggplot2)


data(barnacle)

# Nonparametric regression without interactions
fit <- frfast(DW ~ RC, data = barnacle, nboot = 50) 
autoplot(fit)
autoplot(fit, points = FALSE) + ggtitle("Title")
autoplot(fit, der = 1) + xlim(4, 20)
#autoplot(fit, der = 1, col = "red", CIcol = "blue")

# Nonparametric regression with interactions
fit2 <- frfast(DW ~ RC : F, data = barnacle, nboot = 50) 
autoplot(fit2, fac = "barca")
# autoplot(fit2, der = 1, fac = "lens")

# Visualization of the differences between two factor's levels
autoplot(fit2, fac = "barca", diffwith = "lens")
# autoplot(fit2, der = 1, fac = "barca", diffwith = "lens")


#Plotting in the same graphics device
## Not run: 
##D 
##D if (requireNamespace("gridExtra", quietly = TRUE)) {
##D 
##D # For plotting two derivatives in the same graphic windows
##D ders <- lapply(0:1, function(x) autoplot(fit, der = x))
##D gridExtra::grid.arrange(grobs = ders, ncol = 2, nrow = 1)
##D 
##D # For plotting two levels in the same graphic windows
##D facs <- lapply(c("barca", "lens"), function(x) autoplot(fit2, der = 0, fac = x))
##D gridExtra::grid.arrange(grobs = facs, ncol = 2, nrow = 1)
##D 
##D }
##D 
## End(Not run)




