library(cNORM)


### Name: rankBySlidingWindow
### Title: Determine the norm scores of the participants by sliding window
###   (experimental)
### Aliases: rankBySlidingWindow

### ** Examples

## Not run: 
##D # Transformation using a sliding window
##D data.elfe2 <- rankBySlidingWindow(elfe, raw="raw", age="group", width=0.5)
##D 
##D # Comparing this to the traditional approach should give us exactly the same
##D # values, since the sample dataset only has a grouping variable for age
##D data.elfe <- rankByGroup(elfe, group = "group")
##D mean(data.elfe$normValue - data.elfe2$normValue)
## End(Not run)



