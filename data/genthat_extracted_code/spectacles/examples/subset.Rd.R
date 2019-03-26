library(spectacles)


### Name: subset
### Title: Subset SpectraDataFrame object
### Aliases: subset subset.SpectraDataFrame subset,SpectraDataFrame-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Subset on attributes
s <- subset(australia, carbon < 5)

# Subset and selection of attributes
s <- subset(australia, carbon < 5, select = 1)



