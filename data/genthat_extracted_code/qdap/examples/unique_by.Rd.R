library(qdap)


### Name: unique_by
### Title: Find Unique Words by Grouping Variable
### Aliases: unique_by
### Keywords: unique

### ** Examples

## Not run: 
##D dat <- pres_debates2012[pres_debates2012$time == "time 3", ]
##D with(dat, unique_by(dialogue, person))
##D with(pres_debates2012, unique_by(dialogue, list(time, person)))
##D 
##D with(DATA, unique_by(state, person))
## End(Not run)



