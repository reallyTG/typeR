library(crplyr)


### Name: unweighted_n
### Title: Return the unweighted counts from summarize
### Aliases: unweighted_n

### ** Examples

## Not run: 
##D ds %>%
##D    group_by(cyl) %>%
##D    summarize(
##D        raw_counts = unweighted_n(),
##D        mean = mean(wt)
##D    )
## End(Not run)



