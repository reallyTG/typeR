library(AHMbook)


### Name: MHB2014
### Title: Data from the Swiss Breeding Bird Survey 2014
### Aliases: MHB2014
### Keywords: datasets

### ** Examples

data(MHB2014)
str(MHB2014)

# Create the objects at foot of p.644:
( nsite <- nrow(MHB2014$sites) )    # number of sites in Swiss MHB
nrep <- 3                           # maximum number of replicate surveys per season
( nspec <- nrow(MHB2014$species) )  # 158 species occur in the 2014 data
# Check the dimensions of the 'count' array:
dim(MHB2014$count) == c(nsite, nrep, nspec)

# Create the detection/nondetection matrix 'y':
y <- MHB2014$count > 0        # this is logical, convert to integer
storage.mode(y) <- "integer"  # don't use 'as.integer', that strips out dimensions and names
str(y)

# Pull out and check the data for common chaffinch, p.645:
head(tmp <- y[, , "Common Chaffinch"])
tail(tmp)




