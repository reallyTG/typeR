library(kzs)


### Name: kzs
### Title: Kolmogorov-Zurbenko Spline
### Aliases: kzs
### Keywords: smooth ts nonparametric

### ** Examples


# Total time t
t <- seq(from = -round(400*pi), to = round(400*pi), by = .25) 

# Construct the signal over time
ts <- 0.5*sin(sqrt((2*pi*abs(t))/200))
signal <- ifelse(t < 0, -ts, ts)

# Bury the signal in noise [randomly, from N(0, 1)]
et <- rnorm(length(t), mean = 0, sd = 1)
yt <- et + signal

# Data frame of (t, yt) 
pts <- data.frame(cbind(t, yt))


### EXAMPLE 1 - Apply kzs to the signal buried in noise                 

# Plot of the true signal
plot(signal ~ t, xlab = "t", ylab = "Signal", main = "True Signal",
type = "l")

# Plot of signal + noise
plot(yt ~ t, ylab = "yt", main = "Signal buried in noise", type = "p")

# Apply 3 iterations of kzs
kzs(y = pts[,2], x = pts[,1], smooth = 80, scale = .2, k = 3, edges = TRUE,
plot = TRUE)
lines(signal ~ t, col = "red")
title(main = "kzs(smooth = 80, scale = .2, k = 3, edges = TRUE)")
legend("topright", c("True signal","kzs estimate"), cex = 0.8,
col = c("red", "black"), lty = 1:1, lwd = 2, bty = "n")

### EXAMPLE 2 - Irregularly observed data over time

# Cancel a random 20 percent of (t, yt) leaving irregularly observed time points
obs <- seq(1:length(t))
t20 <- sample(obs, size = length(obs)/5)
pts20 <- pts[-t20,]        

# Plot of (t,yt) with 20 percent of the data removed
plot(pts20$yt ~ pts20$t, main = "Signal buried in noise\n20 percent of 
(t, yt) deleted", xlab = "t", ylab = "yt", type = "p")

# Apply 3 iterations of kzs
kzs(y = pts20[,2], x = pts20[,1], smooth = 80, scale = .2, k = 3, edges = TRUE, 
plot = TRUE)
lines(signal ~ t, col = "red")
title(main = "kzs(smooth = 80, scale = .2, k = 3, edges = TRUE)")
legend("topright", c("True signal","kzs estimate"), cex = 0.8, 
col = c("red", "black"), lty = 1:1, lwd = 2, bty = "n")  



