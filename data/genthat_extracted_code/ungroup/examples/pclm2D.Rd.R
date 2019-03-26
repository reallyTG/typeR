library(ungroup)


### Name: pclm2D
### Title: Two-Dimensional Penalized Composite Link Model (PCLM-2D)
### Aliases: pclm2D

### ** Examples

# Input data
Dx <- ungroup.data$Dx
Ex <- ungroup.data$Ex

# Aggregate data to ungroup it in the examples below
x      <- c(0, 1, seq(5, 85, by = 5))
nlast  <- 26
n      <- c(diff(x), nlast)
group  <- rep(x, n)
y      <- aggregate(Dx, by = list(group), FUN = "sum")[, -1]
offset <- aggregate(Ex, by = list(group), FUN = "sum")[, -1]

# Example 1 ---------------------- 
# Fit model and ungroup data using PCLM-2D
P1 <- pclm2D(x, y, nlast)
summary(P1)
# plot(P1)

## Not run: 
##D # NOTE: pclm2D does not search for optimal smoothing parameters by default
##D # (like pclm) because it is more time consuming. If optimization is required
##D # set lambda = c(NA, NA):
##D 
##D P1 <- pclm2D(x, y, nlast, control = list(lambda = c(NA, NA)))
##D 
##D # Example 2 ---------------------- 
##D # Ungroup and build a mortality surface
##D P2 <- pclm2D(x, y, nlast, offset)
##D summary(P2)
##D 
##D plot(P2)                      # plot
##D library(rgl)
##D snapshot3d("plotP2.jpeg")     # save the plot in jpeg format
##D aspect3d(x = 1, y = 2, z = 1) # modify the aspect ratio
## End(Not run)



