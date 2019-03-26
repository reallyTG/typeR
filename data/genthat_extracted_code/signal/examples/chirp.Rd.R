library(signal)


### Name: chirp
### Title: A chirp signal
### Aliases: chirp
### Keywords: math

### ** Examples

ch <- chirp(seq(0, 0.6, len=5000))
plot(ch, type = "l")

# Shows a quadratic chirp of 400 Hz at t=0 and 100 Hz at t=10
# Time goes from -2 to 15 seconds.
specgram(chirp(seq(-2, 15, by=0.001), 400, 10, 100, "quadratic"))

# Shows a logarithmic chirp of 200 Hz at t=0 and 500 Hz at t=2
# Time goes from 0 to 5 seconds at 8000 Hz.
specgram(chirp(seq(0, 5, by=1/8000), 200, 2, 500, "logarithmic"))



