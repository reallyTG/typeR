library(Langevin)


### Name: timeseries1D
### Title: Generate a 1D Langevin process
### Aliases: timeseries1D

### ** Examples

# Generate standardized Ornstein-Uhlenbeck-Process (d11=-1, d20=1)
# with integration time step 0.01 and sampling frequency 1
s <- timeseries1D(N=1e4, sf=1, dt=0.01);
t <- 1:1e4;
plot(t, s, t="l", main=paste("mean:", mean(s), " var:", var(s)));



