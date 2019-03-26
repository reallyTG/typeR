library(spectacles)


### Name: features
### Title: Retrieves or sets the data slot of a SpectraDataFrame object.
### Aliases: features features<- features-methods
###   features,SpectraDataFrame-method features<-,Spectra-method
###   features<-,SpectraDataFrame-method

### ** Examples


# Loading example data
data(oz)
spectra(oz) <- sr_no ~ ... ~ 350:2500

# Printing available data
features(oz)

# Promoting a Spectra to a SpectraDataFrame object
s <- as(oz, "Spectra")

# Generating dummy data
d <- data.frame(
  id = ids(oz), 
  foo = runif(nrow(oz)), 
  bar = sample(LETTERS[1:5], size = nrow(oz), replace = TRUE)
)
head(d)

# Affecting data to Spectra object
features(s, key = 'id') <- d

# Adding data to an existing SpectraDataFrame object
features(oz, key = 'id') <- d
features(oz)

# Replacing data of an existing SpectraDataFrame object
features(oz, key = 'id', append = FALSE) <- d
features(oz)




