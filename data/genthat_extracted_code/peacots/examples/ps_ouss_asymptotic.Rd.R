library(peacots)


### Name: ps_ouss_asymptotic
### Title: Power spectrum of the OUSS process
### Aliases: ps_ouss_asymptotic
### Keywords: ~kwd1 ~kwd2

### ** Examples

# generate OUSS time series
times  = seq(0,20,0.25);
signal = generate_ouss(times, mu=0, sigma=1, lambda=1, epsilon=0.5);

# calculate periodogram and fit OUSS model
report = evaluate.pm(times=times, signal=signal, startRadius=2);

# plot periodogram
plot(report$frequencies, report$periodogram, 
     type="l", ylab="power", xlab="frequency", main="periodogram & fitted OUSS power spectrum");

# plot OUSS power spectrum
lines(report$frequencies, 
      ps_ouss_asymptotic( freq=report$frequencies, 
                          power_o=report$power_o, 
                          lambda=report$lambda, 
                          power_e=report$power_e, 
                          time_step=report$time_step), 
      col="red");




