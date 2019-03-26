library(ddpcr)


### Name: plot.pnpp_experiment
### Title: Plot a ddPCR plate of type PNPP experiment
### Aliases: plot.pnpp_experiment
### Keywords: internal

### ** Examples

## Not run: 
##D plate <- new_plate(sample_data_dir(), type = plate_types$pnpp_experiment)
##D positive_dim(plate) <- "Y"
##D plot(plate)
##D plate <- plate %>% analyze
##D plot(plate)
##D plot(plate, "A01:C05", col_drops_rain = "blue")
## End(Not run)



