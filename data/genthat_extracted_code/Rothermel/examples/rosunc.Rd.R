library(Rothermel)


### Name: rosunc
### Title: Function to carry out uncertainty propagation analysis on
###   Rothermel's (1972) fire spread model
### Aliases: rosunc
### Keywords: models

### ** Examples

data ("firexp")
varnames <- names (firexp)

# select only one observation and create a numeric vector for function input
firexp <- as.numeric (firexp [5,])
names (firexp) <- varnames

pred <- rosunc (
        modeltype = "D",
        w = firexp [1:5],
        s = firexp [6:10],
        delta = firexp ["Fuel_Bed_Depth"],
        mx.dead = firexp ["Mx_dead"],
        h = firexp [13:17],
        m = firexp [18:22],
        u = firexp ["u"],
        slope = firexp ["slope"],
        sdm = 0.3,
        nsim = 100)

summary (pred)

# Figure
hist (pred, 
      xlab = "ROS [m/min]",
      freq = FALSE,
      xlim = c (0, max (pred)),
      breaks = 20,
      main = "")
lines (density (pred), lty=2, lwd=2)
abline (v = firexp ["ros"],col = "red")
text (firexp ["ros"], 
      max (density (pred)$y), 
      labels = "obs", 
      pos = 4)



