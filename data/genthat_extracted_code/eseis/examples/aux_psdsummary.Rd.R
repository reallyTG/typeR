library(eseis)


### Name: aux_psdsummary
### Title: Generate spectrograms for seismic stations at different time
###   periods
### Aliases: aux_psdsummary
### Keywords: eseis

### ** Examples


## Not run: 
##D 
##D ## PSD generation with minimum input arguments
##D aux_psdsummary(station = c("STA01", "STA02"), 
##D                period = as.POSIXct(x = c("2017-04-01",
##D                                          "2017-04-03"), 
##D                                    tz = "UTC"), 
##D                input_dir = "~/data/seismic/sac/")
##D 
##D ## PSD generation with some more arguments
##D aux_psdsummary(station = c("STA01", "STA02"), 
##D                component = "BHZ",
##D                period = as.POSIXct(x = c("2017-04-01",
##D                                          "2017-04-03"), 
##D                                    tz = "UTC"), 
##D                output = c("daily", "monthly"),
##D                input_dir = "~/data/seismic/sac/",
##D                aggregate = c(2, 10), 
##D                n_dates = 1000,
##D                jpg_dim = c(1600, 900, 300, 50), 
##D                verbose = TRUE)
## End(Not run)




