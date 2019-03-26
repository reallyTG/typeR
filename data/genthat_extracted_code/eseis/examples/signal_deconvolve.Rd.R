library(eseis)


### Name: signal_deconvolve
### Title: Deconvolve a signal vector.
### Aliases: signal_deconvolve
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## deconvolve signal with minimum effort
rockfall_decon <- signal_deconvolve(data = rockfall_eseis)

## plot time series
plot_signal(data = rockfall_decon, 
     main = "Rockfall, deconvolved signal", 
     ylab = "m/s")
 
## add new logger manually
logger_new <- list_logger()[[1]]

## add logger data
logger_new$ID <- "logger_new"
logger_new$name <- "logger_new"
logger_new$AD <- 2.4414e-07

## deconvolve signal with new logger
rockfall_decon <- signal_deconvolve(data = rockfall_eseis,
                                    sensor = "TC120s", 
                                    logger = logger_new)
                                    
## Change the setup of a logger, here: Centaur AD is changed due to 
## other than default Vpp value, according to AD = V / (2^24).

## extract default Centaur logger
Centaur_10V <- list_logger()[[2]]

## replace AD value
Centaur_10V$AD <- 20/(2^24)
                                    



