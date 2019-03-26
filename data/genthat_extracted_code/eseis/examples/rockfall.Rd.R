library(eseis)


### Name: rockfall
### Title: Seismic trace of a rockfall event.
### Aliases: rockfall rockfall_z rockfall rockfall_t rockfall
###   rockfall_eseis
### Keywords: datasets

### ** Examples


## load example data set
data(rockfall)

## plot signal vector using base functionality
plot(x = rockfall_t, y = rockfall_z, type = "l")

## plot signal vector using the package plot function
plot_signal(data = rockfall_z, time = rockfall_t)


## load example data set
data(rockfall)


## load example data set
data(rockfall)




