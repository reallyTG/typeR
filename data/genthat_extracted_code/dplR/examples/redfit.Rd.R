library(dplR)


### Name: redfit
### Title: Red-Noise Spectra of Time-Series
### Aliases: redfit runcrit
### Keywords: ts htest

### ** Examples

# Create a simulated tree-ring width series that has a red-noise
# background ar1=phi and sd=sigma and an embedded signal with 
# a period of 10 and an amplitude of have the rednoise sd.
library(graphics)
library(stats)
runif(1)
rs <- .Random.seed
set.seed(123)
nyrs <- 500
yrs <- 1:nyrs

# Here is an ar1 time series with a mean of 2mm,
# an ar1 of phi, and sd of sigma
phi <- 0.7
sigma <- 0.3
sigma0 <- sqrt((1 - phi^2) * sigma^2)
x <- arima.sim(list(ar = phi), n = nyrs, sd = sigma0) + 2

# Here is a sine wave at f=0.1 to add in with an amplitude
# equal to half the sd of the red noise background
per <- 10
amp <- sigma0 / 2
wav <- amp * sin(2 * pi / per * yrs)

# Add them together so we have signal and noise
x <- x + wav

# Here is the redfit spec
redf.x <- redfit(x, nsim = 500)

# Acceptance region of number of runs test
# (not useful with default arguments of redfit())
runcrit(length(redf.x[["freq"]]))

op <- par(no.readonly = TRUE) # Save to reset on exit
par(tcl = 0.5, mar = rep(2.2, 4), mgp = c(1.1, 0.1, 0))

plot(redf.x[["freq"]], redf.x[["gxxc"]],
     ylim = range(redf.x[["ci99"]], redf.x[["gxxc"]]),
     type = "n", ylab = "Spectrum", xlab = "Frequency (1/yr)",
     axes = FALSE)
grid()
lines(redf.x[["freq"]], redf.x[["gxxc"]], col = "#1B9E77")
lines(redf.x[["freq"]], redf.x[["ci99"]], col = "#D95F02")
lines(redf.x[["freq"]], redf.x[["ci95"]], col = "#7570B3")
lines(redf.x[["freq"]], redf.x[["ci90"]], col = "#E7298A")
freqs <- pretty(redf.x[["freq"]])
pers <- round(1 / freqs, 2)
axis(1, at = freqs, labels = TRUE)
axis(3, at = freqs, labels = pers)
mtext(text = "Period (yr)", side = 3, line = 1.1)
axis(2); axis(4)
legend("topright", c("x", "CI99", "CI95", "CI90"), lwd = 2,
       col = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A"),
       bg = "white")
box()

## Not run: 
##D # Second example with tree-ring data
##D # Note the long-term low-freq signal in the data. E.g.,
##D # crn.plot(cana157)
##D 
##D library(utils)
##D data(cana157)
##D yrs <- time(cana157)
##D x <- cana157[, 1]
##D redf.x <- redfit(x, nsim = 1000)
##D 
##D plot(redf.x[["freq"]], redf.x[["gxxc"]],
##D      ylim = range(redf.x[["ci99"]], redf.x[["gxxc"]]),
##D      type = "n", ylab = "Spectrum", xlab = "Frequency (1/yr)",
##D      axes = FALSE)
##D grid()
##D lines(redf.x[["freq"]], redf.x[["gxxc"]], col = "#1B9E77")
##D lines(redf.x[["freq"]], redf.x[["ci99"]], col = "#D95F02")
##D lines(redf.x[["freq"]], redf.x[["ci95"]], col = "#7570B3")
##D lines(redf.x[["freq"]], redf.x[["ci90"]], col = "#E7298A")
##D freqs <- pretty(redf.x[["freq"]])
##D pers <- round(1 / freqs, 2)
##D axis(1, at = freqs, labels = TRUE)
##D axis(3, at = freqs, labels = pers)
##D mtext(text = "Period (yr)", side = 3, line = 1.1)
##D axis(2); axis(4)
##D legend("topright", c("x", "CI99", "CI95", "CI90"), lwd = 2,
##D        col = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A"),
##D        bg = "white")
##D box()
##D par(op)
## End(Not run)
.Random.seed <- rs



