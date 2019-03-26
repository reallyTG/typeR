library(datadr)


### Name: bsv
### Title: Construct Between Subset Variable (BSV)
### Aliases: bsv getBsv getBsvs

### ** Examples

irisDdf <- ddf(iris)

bsvFn <- function(dat) {
  list(
    meanSL = bsv(mean(dat$Sepal.Length), desc = "mean sepal length"),
    meanPL = bsv(mean(dat$Petal.Length), desc = "mean petal length")
  )
}

# divide the data by species
bySpecies <- divide(irisDdf, by = "Species", bsvFn = bsvFn)
# see BSV info attached to the result
bsvInfo(bySpecies)
# get BSVs for a specified subset of the division
getBsvs(bySpecies[[1]])




