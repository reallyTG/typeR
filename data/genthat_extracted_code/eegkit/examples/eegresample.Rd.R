library(eegkit)


### Name: eegresample
### Title: Change Sampling Rate of EEG Data
### Aliases: eegresample

### ** Examples


##########   EXAMPLE 1   ##########

# create vector with N = 200 time points
N <- 200
x <- sin(4 * pi * seq(0, 1, length.out = N))

# down-sample (i.e., decrease sampling rate) to n = 100
y <- eegresample(x, n = 100)
mean((y - sin(4 * pi * seq(0, 1, length.out = 100)))^2)

# up-sample (i.e., increase sampling rate) to n = 500
z <- eegresample(x, n = 500)
mean((z - sin(4 * pi * seq(0, 1, length.out = 500)))^2)

# plot results
par(mfrow = c(1,3))
plot(x, main = "Original (N = 200)")
plot(y, main = "Down-sampled (n = 100)")
plot(z, main = "Up-sampled (n = 500)")


##########   EXAMPLE 2   ##########

# create matrix with N = 500 time points and 2 columns
N <- 500
x <- cbind(sin(2 * pi * seq(0, 1, length.out = N)),
           sin(4 * pi * seq(0, 1, length.out = N)))
           
# down-sample (i.e., decrease sampling rate) to n = 250
y <- eegresample(x, n = 250)
ytrue <- cbind(sin(2 * pi * seq(0, 1, length.out = 250)),
               sin(4 * pi * seq(0, 1, length.out = 250)))
mean((y - ytrue)^2)

# up-sample (i.e., increase sampling rate) to n = 1000
z <- eegresample(x, n = 1000)
ztrue <- cbind(sin(2 * pi * seq(0, 1, length.out = 1000)),
               sin(4 * pi * seq(0, 1, length.out = 1000)))
mean((z - ztrue)^2)

# plot results
par(mfrow = c(1,3))
plot(x[,1], main = "Original (N = 500)", cex = 0.5)
points(x[,2], pch = 2, col = "blue", cex = 0.5)
plot(y[,1], main = "Down-sampled (n = 250)", cex = 0.5)
points(y[,2], pch = 2, col = "blue", cex = 0.5)
plot(z[,1], main = "Up-sampled (n = 1000)", cex = 0.5)
points(z[,2], pch = 2, col = "blue", cex = 0.5)




