library(entropart)


### Name: MetaCommunity
### Title: Metacommunity class
### Aliases: MetaCommunity is.MetaCommunity plot.MetaCommunity
###   summary.MetaCommunity

### ** Examples

# Use BCI data from vegan package
if (require(vegan, quietly = TRUE)) {
  # Load BCI data (number of trees per species in each 1-ha plot of a tropical forest)
  data(BCI)
  # BCI dataframe must be transposed (its lines are plots, not species)
  BCI.df <- as.data.frame(t(BCI))
  # Create a metacommunity object from a matrix of abundances and a vector of weights
  # (here, all plots have a weight equal to 1)
  MC <- MetaCommunity(BCI.df)
}



