library(datadr)


### Name: ddf-accessors
### Title: Accessor methods for 'ddf' objects
### Aliases: NCOL NCOL,ddf-method NROW NROW,ddf-method ddf-accessors
###   names.ddf ncol ncol,ddf-method nrow nrow,ddf-method splitRowDistn
###   summary.ddf summary.ddo

### ** Examples

d <- divide(iris, by = "Species", update = TRUE)
nrow(d)
ncol(d)
length(d)
names(d)
summary(d)
getKeys(d)



