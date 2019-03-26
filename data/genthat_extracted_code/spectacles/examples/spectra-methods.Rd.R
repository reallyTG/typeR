library(spectacles)


### Name: spectra-methods
### Title: Retrieves or sets the spectra of a 'Spectra*' objects.
### Aliases: spectra-methods spectra spectra<- spectra,data.frame-method
###   spectra,Spectra-method spectra,SpectraDataFrame-method
###   spectra<-,data.frame-method spectra<-,Spectra-method

### ** Examples


# Loading example data
data(oz)
class(oz) # this is a simple data.frame
# structure of the data.frame: it is rowwise-formatted
big.head(oz) 

## CREATING Spectra OBJECTS
##

# Using spectra() to initiate a Spectra from 
# the data.frame
spectra(oz) <- sr_no ~ 350:2500

# It is possible to select wavelengths using the formula interface
data(oz)
spectra(oz) <- sr_no ~ 350:5:2500

data(oz)
spectra(oz) <- sr_no ~ 500:1800

## CREATING SpectraDataFrame OBJECTS
##

# Using spectra() to initiate a SpectraDataFrame from 
# the data.frame
data(oz)
spectra(oz) <- sr_no ~ carbon + ph + clay ~ 350:2500

# Selecting data to be included in the SpectradataFrame object
data(oz)
spectra(oz) <- sr_no ~ carbon ~ 350:2500

# Forcing the creation of new ids using the id keyword in the 
# formula interface
data(oz)
spectra(oz) <- id ~ carbon ~ 350:2500
ids(oz, as.vector = TRUE)

# Using the "..." short-hand to select all the remaining columns
data(oz)
spectra(oz) <- sr_no ~ ... ~ 350:2500

## CREATING Spectra OBJECTS FROM
## BY-COLS-FORMATTED DATA
##

# For data formatted in the colwise format, 
# use the "colwise" mode

# Transforming data into colwise format
# for demonstration's sake
#
m <- melt_spectra(oz)
oz_by_col <- reshape2::acast(m, ... ~ sr_no)
oz_by_col <- data.frame(
  wl = rownames(oz_by_col), 
  oz_by_col, 
  check.names = FALSE)

# Here's colwise-formatted data 
big.head(oz_by_col)

# Convert it into Spectra object
spectra(oz_by_col, mode = "colwise") <- wl ~ ...

# Then data can be added to promote it as a SpectraDataFrame
my.data <- features(oz, exclude_id = FALSE)
features(oz_by_col, key = 'sr_no') <- my.data




