library(Rlibeemd)


### Name: bemd
### Title: Bivariate EMD decomposition
### Aliases: bemd

### ** Examples

N <- 512 
t <- 2 * pi * (0:(N-1))/N
input <- cos(0.3 * t) * exp(2i * t) + 0.3 * abs(sin(2.3 * t)) * exp(17i * t)

# Use evenly spaced angles as directions
num_directions <- 64
directions <- 2 * pi * 1:num_directions / num_directions
imfs <- bemd(input, directions, num_imfs = 4, num_siftings = 10)

# plot the data
plot(Re(input), Im(input), xlim = c(-1, 2))
# plot signal and the imfs
for(i in 1:4)
  points(Re(imfs[,i]), Im(imfs[,i]), col = 1 + i)
legend("bottomright", col = 1:5, legend = c("signal", paste0("IMF ",1:4)), pch = 1)

data("float")
plot(float, type = "l")
signal <- float[, 1] + float[, 2] * 1i
imfs <- bemd(signal, num_siftings = 10, num_imfs = 4)

# plot the data and the imfs
oldpar <- par()
par(mfrow = c(5, 1), mar = c(0.5, 4.5, 0.5, 0.5), oma = c(4, 0, 2, 0))
ts.plot(float, col = 1:2, lty = 1:2, ylab = "signal", gpars = list(xaxt = "n"))
for(i in 1:4) {
  ts.plot(Re(imfs[, i]), Im(imfs[, i]), col = 1:2, lty = 1:2, 
    ylab = if(i < 4) paste("IMF", i) else "residual", gpars = list(xaxt = "n"))
 }
axis(1)
title(xlab = "Time (days)", main = "Bivariate EMD decomposition", outer = TRUE)
par(oldpar)



