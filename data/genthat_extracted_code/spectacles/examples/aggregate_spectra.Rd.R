library(spectacles)


### Name: aggregate_spectra
### Title: Aggregates spectral and data information
### Aliases: aggregate_spectra aggregate_spectra,Spectra-method
###   aggregate_spectra,SpectraDataFrame-method
###   aggregate_spectra,SpectraDataFrame-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Aggregation on the whole collection
m <- aggregate_spectra(australia, fun = mean)
plot(m)

# Aggregation factor-wise

# Generate some kind of factor
australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE)
m <- aggregate_spectra(australia, fun = mean, id = 'fact')
plot(m)



