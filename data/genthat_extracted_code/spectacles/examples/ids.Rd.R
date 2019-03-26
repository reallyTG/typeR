library(spectacles)


### Name: ids
### Title: Retrieves or sets the ids of a 'Spectra*' object.
### Aliases: ids ids<- ids,Spectra-method ids<-,Spectra-method
###   ids<-,SpectraDataFrame-method ids<-,Spectra-method
###   ids<-,SpectraDataFrame-method

### ** Examples


# Loading example data
data(oz)
spectra(oz) <- sr_no ~ ... ~ 350:2500

# Retrieving ids
ids(oz)

# Setting ids using a vector of values
ids(oz) <- seq_len(nrow(oz))
ids(oz)

# Setting ids using an attribute
oz$new_id <- seq_len(nrow(oz)) + 1000
ids(oz) <- ~ new_id
ids(oz)




