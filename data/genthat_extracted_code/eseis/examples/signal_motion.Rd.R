library(eseis)


### Name: signal_motion
### Title: Calculate particle motion parameters
### Aliases: signal_motion
### Keywords: eseis

### ** Examples

## load example data set
data(earthquake)

## filter seismic signals
s <- eseis::signal_filter(data = s, 
                          dt = 1/200, 
                          f = c(1, 3))

## integrate signals to get displacement
s_d <- eseis::signal_integrate(data = s, dt = 1/200)

## calculate particle motion parameters
pm <- signal_motion(data = s_d, 
                    time = t, 
                    dt = 1 / 200,
                    window = 100, 
                    step = 10)
                    
## plot function output
par_original <- par(no.readonly = TRUE)
par(mfcol = c(2, 1))

plot(x = t, y = s$BHZ, type = "l")
plot(x = pm$time, y = pm$azimuth, type = "l")

par(par_original)




