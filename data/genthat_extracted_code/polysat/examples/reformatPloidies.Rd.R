library(polysat)


### Name: reformatPloidies
### Title: Convert Ploidy Format of a Dataset
### Aliases: reformatPloidies
### Keywords: manip

### ** Examples

# Make a new "genambig" object for this example
testdata <- new("genambig")
Ploidies(testdata)

## If you need to reformat before you have entered any ploidy
## information:

# convert from matrix to sample format
testdata <- reformatPloidies(testdata, output="sample")
Ploidies(testdata)

## If you have entered ploidy information but realized you can use a
## simpler format:

# Enter some ploidies
Ploidies(testdata)[1] <- 2
Ploidies(testdata)

# Convert from "sample" to "one" with na.rm=TRUE
testdata <- reformatPloidies(testdata, na.rm=TRUE, output="one")
Ploidies(testdata)

## If you change your mind and want to go back to a more complex format

# Convert from "one" to "locus"
testdata <- reformatPloidies(testdata, output="locus")
Ploidies(testdata)



