library(ecodist)


### Name: crosstab
### Title: Data formatting
### Aliases: crosstab
### Keywords: manip multivariate

### ** Examples

# Make a random example
plotnames <- rep(1:5, each = 6)
speciesnames <- rep(c("A", "B", "C"), 10)
freqdata <- runif(30)

# number of samples of each species and plot
crosstab(plotnames, speciesnames)

# can use the data argument
speciesdata <- data.frame(plots = plotnames, species = speciesnames,
  freq = freqdata, stringsAsFactors=FALSE)

# mean frequency by species and plot
crosstab(plots, species, freq, data=speciesdata, type="mean")

# can specify additional possible row or column levels
crosstab(plots, species, freq, data=speciesdata, type="mean", allcols=LETTERS[1:5])



