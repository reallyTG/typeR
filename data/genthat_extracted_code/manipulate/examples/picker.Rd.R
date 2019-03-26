library(manipulate)


### Name: picker
### Title: Create a picker control
### Aliases: picker

### ** Examples

## Not run: 
##D 
##D ## Filtering data with a picker
##D manipulate(
##D   barplot(as.matrix(longley[,factor]),
##D           beside = TRUE, main = factor),
##D   factor = picker("GNP", "Unemployed", "Employed"))
##D 
##D ## Create a picker with labels
##D manipulate(
##D   plot(pressure, type = type),
##D   type = picker("points" = "p", "line" = "l", "step" = "s"))
##D 
##D ## Picker with groups
##D manipulate(
##D   barplot(as.matrix(mtcars[group,"mpg"]), beside=TRUE),
##D   group = picker("Group 1" = 1:11,
##D                  "Group 2" = 12:22,
##D                  "Group 3" = 23:32))
##D 
##D ## Histogram w/ picker to select type
##D require(lattice)
##D require(stats)
##D manipulate(
##D   histogram(~ height | voice.part,
##D             data = singer, type = type),
##D   type = picker("percent", "count", "density"))
##D 
## End(Not run)



