library(pracma)


### Name: approx_entropy
### Title: Approximate and Sample Entropy
### Aliases: approx_entropy sample_entropy
### Keywords: timeseries

### ** Examples

ts <- rep(61:65, 10)
approx_entropy(ts, edim = 2)                      # -0.0004610253
sample_entropy(ts, edim = 2)                      #  0

set.seed(8237)
approx_entropy(rnorm(500), edim = 2)              # 1.351439  high, random
approx_entropy(sin(seq(1,100,by=0.2)), edim = 2)  # 0.171806  low,  deterministic
sample_entropy(sin(seq(1,100,by=0.2)), edim = 2)  # 0.2359326

## Not run: 
##D (Careful: This will take several minutes.)
##D # generate simulated data
##D N <- 1000; t <- 0.001*(1:N)
##D sint   <- sin(2*pi*10*t);    sd1 <- sd(sint)    # sine curve
##D whitet <- rnorm(N);          sd2 <- sd(whitet)  # white noise
##D chirpt <- sint + 0.1*whitet; sd3 <- sd(chirpt)  # chirp signal
##D 
##D # calculate approximate entropy
##D rnum <- 30; result <- zeros(3, rnum)
##D for (i in 1:rnum) {
##D     r <- 0.02 * i
##D     result[1, i] <- approx_entropy(sint,   2, r*sd1)
##D     result[2, i] <- approx_entropy(chirpt, 2, r*sd2)
##D     result[3, i] <- approx_entropy(whitet, 2, r*sd3)
##D }
##D 
##D # plot curves
##D r <- 0.02 * (1:rnum)
##D plot(c(0, 0.6), c(0, 2), type="n",
##D      xlab = "", ylab = "", main = "Approximate Entropy")
##D points(r, result[1, ], col="red");    lines(r, result[1, ], col="red")
##D points(r, result[2, ], col="green");  lines(r, result[2, ], col="green")
##D points(r, result[3, ], col="blue");   lines(r, result[3, ], col="blue")
##D grid()
## End(Not run)



