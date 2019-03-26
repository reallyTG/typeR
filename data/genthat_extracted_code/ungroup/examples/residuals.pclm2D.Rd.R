library(ungroup)


### Name: residuals.pclm2D
### Title: Extract PCLM-2D Deviance Residuals
### Aliases: residuals.pclm2D

### ** Examples


Dx <- ungroup.data$Dx
Ex <- ungroup.data$Ex

# Aggregate data to ungroup it in the example below
x      <- c(0, 1, seq(5, 85, by = 5))
nlast  <- 26
n      <- c(diff(x), nlast)
group  <- rep(x, n)
y      <- aggregate(Dx, by = list(group), FUN = "sum")[, -1]

# Example
P1 <- pclm2D(x, y, nlast)

residuals(P1)



