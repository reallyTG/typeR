library(spectacles)


### Name: split
### Title: Split a Spectra* object using factors
### Aliases: split split.Spectra split,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# On a Spectra object, we need to provide a vector of factors
# to split the object
s <- as(australia, 'Spectra')
# We make up some kind of factor to split the data. 
idx <- sample(letters[1:5], replace = TRUE, size = nrow(s)) # This is a vector
r <- split(s, idx)
str(r)

# On a SpectradataFrame object, we can also provide the name or index 
# of an attribute

# Generate some kind of factor
australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE) 
r <- split(australia, 'fact')
str(r)

# A list is returned, and is thus ready for use with lapply, or any
# of the l*ply functions from the plyr package
lapply(r, nrow)



