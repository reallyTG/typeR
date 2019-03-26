library(trimr)


### Name: nonRecursive
### Title: nonRecursive trimming procedure.
### Aliases: nonRecursive

### ** Examples

# load the example data that ships with trimr
data(exampleData)

# perform the trimming, returning mean RT
trimmedData <- nonRecursive(data = exampleData, minRT = 150)



