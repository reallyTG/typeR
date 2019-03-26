library(Rothermel)


### Name: ros
### Title: Function to predict Rothermel's (1972) rate of spread [m/min]
###   for surface headfires
### Aliases: ros
### Keywords: model

### ** Examples

# Example 1: Simulation using vectors of input values 

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)
u <- 5
slope <- 10

ros(modeltype, w, s, delta, mx.dead, h, m, u, slope)

# Example 2: variable wind input
# Only rate of spread is reported here (i.e., element [15] of ros ( ) output)

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)
slope <- 10

df <- data.frame ("windspeed" = seq (3, 15, 1), ROS=NA)

for (i in 1:nrow (df)) {
  df [i,2] <- 
  ros (modeltype, w, s, delta, mx.dead, h, m, u=df[i,1], slope) [15]
}
df

# Example 3: variable wind and slope input
# A two-entry table of rates of spread is created 

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)

u <- seq (3, 15, 1)
slope <- seq (0, 45, 15)

df <- matrix (rep (NA, length (u) * length (slope)), 
      length (u),
      length (slope)
      )
      
df <- data.frame (u, df)
colnames (df) <- c ("windspeed", 
  paste ("slope_", as.character (slope))
  )

for (i in 1:length (u)) {
  for (j in 1:length (slope)) {
    df [i, j+1] <- ros (
      modeltype, w, s, delta, mx.dead, h, m, u[i], slope[j])[15]
 }
}

df

# Example 4: prediction and validation of rate of spread 
# using existing data from a field experiment

library (Rothermel)

# Observed variables
data (firexp) 
m <- firexp [, 18:22]
u <- firexp [, "u"]
slope <- firexp [, "slope"]
obs <- firexp [, "ros"]

# Predict ROS using Standard Fuel Models GR5, GS3 and SH7
data (SFM_metric)
a = list ( )
models = which (rownames (SFM_metric) == "GR5" |
      rownames (SFM_metric) == "GS3" |
      rownames (SFM_metric) == "SH7")
for (i in 1 : length (models) ) {
     modeltype <- SFM_metric [models [i], 1]
     w <- SFM_metric [models [i], 2:6]
     s <- SFM_metric [models [i], 7:11]
     delta <- SFM_metric [models [i], "Fuel_Bed_Depth"]
     mx.dead <- SFM_metric [models [i], "Mx_dead"]
     h <- SFM_metric [models [i], 14:18]
     a [i] <- ros (modeltype, w, s, delta, mx.dead, h,
        m, u, slope)[15]}
        
# Plot
plot (obs, a [[1]], xlab = "Observed rate of spread (m/min)",
         ylab = "Predicted rate of spread (m/min)",  col = "red",
         pch =19, xlim = c (0, 30), cex.lab = 1.1)
points (obs, a [[2]], pch = 19, col = "green2")
points (obs, a [[3]], pch = 19, col = "blue2")
abline (coef = c(0, 1))
abline (coef = c(0, 0.7),lty = 2); text (13.6, 19.2, "-30 percent")
abline (coef = c(0, 1.3),lty = 2); text (28.7, 19.2, "+30 percent")
legend (0, 19.2, c("GR5", "GS3", "SH7"), pch = 19,
        col = c("red", "green2", "blue2"), title = "Fuel model")

# Inset Residual plot (not run)
par (fig = c (.57, .98, .07, .55), new = TRUE)
plot (obs, a[[1]] - obs, xlab= "", ylab= "", col = "red",
       main= "Residuals", font.main = 1, pch=19, cex=.7)
points (obs, a [[2]] - obs, pch = 19, cex =.7, col = "green2")
points (obs, a [[3]] - obs, pch = 19, cex =.7, col = "blue2")
abline (h = 0)
par (fig = c (0, 1, 0, 1))




