library(hyfo)


### Name: checkBind
### Title: Check data for bind function.
### Aliases: checkBind

### ** Examples

data <- list(c(1,1,1),c(2,2,2))
bind <- 'rbind'
checkBind(data,bind)

data(testdl)
## Not run: 
##D checkBind(testdl, 'rbind')
## End(Not run)
# Since the colnames in testdl are not the same, so it cannot be bound.
#



