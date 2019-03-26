library(Langevin)


### Name: Langevin1D
### Title: Calculate the Drift and Diffusion of one-dimensional stochastic
###   processes
### Aliases: Langevin1D

### ** Examples


# Set number of bins, steps and the sampling frequency
bins <- 20;
steps <- c(1:5);
sf <- 1000;

#### Linear drift, constant diffusion

# Generate a time series with linear D^1 = -x and constant D^2 = 1
x <- timeseries1D(N=1e6, d11=-1, d20=1, sf=sf);
# Do the analysis
est <- Langevin1D(x, bins, steps, sf, reqThreads=2);
# Plot the result and add the theoretical expectation as red line
plot(est$mean_bin, est$D1);
lines(est$mean_bin, -est$mean_bin, col='red');
plot(est$mean_bin, est$D2);
abline(h=1, col='red');

#### Cubic drift, constant diffusion

# Generate a time series with cubic D^1 = x - x^3 and constant D^2 = 1
x <- timeseries1D(N=1e6, d13=-1, d11=1, d20=1, sf=sf);
# Do the analysis
est <- Langevin1D(x, bins, steps, sf, reqThreads=2);
# Plot the result and add the theoretical expectation as red line
plot(est$mean_bin, est$D1);
lines(est$mean_bin, est$mean_bin - est$mean_bin^3, col='red');
plot(est$mean_bin, est$D2);
abline(h=1, col='red');



