library(emuR)


### Name: cr
### Title: Plot digital sinuoids.
### Aliases: cr
### Keywords: dplot

### ** Examples


# cosine wave
cr()

# doubling the frequency, 1/3 amplitude, phase = pi/4, 50 points
cr(A=1/3, k=2, p=pi/4, N=50)

# sum 3 sinusoids of different frequencies)
cr(k=c(1, 3, 4))

# sum 2 sinusoids of different parameters
cr(c(1, 2), c(2, 10), c(0, -pi/3), N=200, type="l")


# store the above to a vector and overlay with noise
v = cr(c(1, 2), c(2, 10), c(0, -pi/3), N=200, type="l", values=TRUE)
r = runif(200, -3, 3)
v = v+r
plot(0:199, v, type="l")


# 100 points of a 50 Hz sinusoid with a 4 Hz bandwidth 
# at a sampling frequency of 200 Hz
cr(k=50, bw=4, samfreq=2000, N=100)

# the same but shift the y-axis by +4 (d.c. offset=+4)
cr(const=4, k=50, bw=4, samfreq=2000, N=100)

# sinusoid multiplied by a decaying exponential (same effect as bandwidth)
cr(expon=-0.95,  N=200, type="l")





