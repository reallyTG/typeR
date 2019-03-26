library(soundgen)


### Name: flatEnv
### Title: Flat envelope
### Aliases: flatEnv

### ** Examples

a = rnorm(500) * seq(1, 0, length.out = 500)
b = flatEnv(a, plot = TRUE, windowLength_points = 5)    # too short
c = flatEnv(a, plot = TRUE, windowLength_points = 250)  # too long
d = flatEnv(a, plot = TRUE, windowLength_points = 50)   # about right

## Not run: 
##D s = soundgen(sylLen = 1000, ampl = c(0, -40, 0), plot = TRUE, osc = TRUE)
##D # playme(s)
##D s_flat1 = flatEnv(s, plot = TRUE, windowLength = 50, method = 'hil')
##D s_flat2 = flatEnv(s, plot = TRUE, windowLength = 10, method = 'rms')
##D # playme(s_flat2)
##D 
##D # Remove DC offset
##D s1 = c(rep(0, 50), runif(1000, -1, 1), rep(0, 50)) +
##D      seq(.3, 1, length.out = 1100)
##D s2 = flatEnv(s1, plot = TRUE, windowLength_points = 50, killDC = FALSE)
##D s3 = flatEnv(s1, plot = TRUE, windowLength_points = 50, killDC = TRUE)
## End(Not run)



