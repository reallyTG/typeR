library(sensR)


### Name: discrimR
### Title: Replicated Thurstonian Model for discrimination analysis
### Aliases: discrimR
### Keywords: models

### ** Examples

## Not run: 
##D freq <- c(10,8,10,9,8,9,9,1,10,10,8,2,6,7,6,7,6,4,5,5,3,3,9,9,5,5,8,8,9,9)
##D tmp <- data.frame(id = factor(1:30), n = rep(10, 30), freq = freq)
##D head(tmp)
##D str(tmp)
##D 
##D fm <- discrimR(cbind(freq, n - freq) ~ 1, tmp, cluster = id,
##D                     start = c(.5, .5), method = "twoAFC",
##D                     ranef = TRUE, zi = TRUE, hess = TRUE, 
##D                     control=list(trace=TRUE, REPORT=1))
##D 
##D names(fm)
##D fm[1:4]
## End(Not run)



