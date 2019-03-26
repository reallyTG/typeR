library(fuzzySim)


### Name: spCodes
### Title: Obtain unique abbreviations of species names
### Aliases: spCodes
### Keywords: character

### ** Examples

data(rotifers)

head(rotifers)

## add a column to 'rotifers' with shorter versions of the species names:

## Not run: 
##D rotifers$spcode <- spCodes(rotifers$species, sep.species = "_", 
##D nchar.gen = 1, nchar.sp = 4, nchar.ssp = 0, sep.spcode = ".")
##D 
##D # this produces an error due to resulting species codes not being unique
## End(Not run)

rotifers$spcode <- spCodes(rotifers$species, sep.species = "_", 
nchar.gen = 1, nchar.sp = 5, nchar.ssp = 0, sep.spcode = ".")

# with a larger number of characters from the specific name,
# resulting codes are now unique

## check out the result:
head(rotifers)



