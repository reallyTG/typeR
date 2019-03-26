library(voteogram)


### Name: theme_voteogram
### Title: voteogram ggplot2 theme
### Aliases: theme_voteogram

### ** Examples

## Not run: 
##D # what you'd normally do
##D sen <- roll_call("senate", 115, 1, 110)
## End(Not run)

# using a saved object
sen <- readRDS(system.file("extdata", "sen.rds", package="voteogram"))

senate_carto(sen) +
  theme_voteogram()



