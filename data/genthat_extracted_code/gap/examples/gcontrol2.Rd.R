library(gap)


### Name: gcontrol2
### Title: genomic control based on p values
### Aliases: gcontrol2
### Keywords: models

### ** Examples

## Not run: 
##D x2 <- rchisq(100,1,.1)
##D p <- pchisq(x2,1,lower.tail=FALSE)
##D r <- gcontrol2(p)
##D print(r$lambda)
## End(Not run)



