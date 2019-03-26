library(spectacles)


### Name: extraction-methods
### Title: Extracting and replacing parts of Spectra* objects
### Aliases: extraction-methods [ [<- [[ [[<- $ $<- [,Spectra-method
###   [[,Spectra-method [[<-,Spectra-method
###   [,Spectra,ANY,ANY,missing-method
###   [,SpectraDataFrame,ANY,ANY,missing-method
###   [[,SpectraDataFrame,ANY,missing-method
###   [[<-,Spectra,ANY,missing-method [<-,SpectraDataFrame-method
###   $<-,Spectra-method $,SpectraDataFrame-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Getting features information from SpectraDataFrame
australia$carbon
australia[['carbon']]

# Creating new features
australia$foo <- runif(nrow(australia))
australia[['bar']] <- runif(nrow(australia))

# Replacing values
australia$foo <- sample(LETTERS[1:5], size = nrow(australia), replace = TRUE)
australia[['bar']] <- sample(c(TRUE, FALSE), size = nrow(australia), replace = TRUE)

# Promote Spectra to SpectraDataFrame
s <- as(australia, 'Spectra')
class(s)
s$foo <- runif(nrow(s))




