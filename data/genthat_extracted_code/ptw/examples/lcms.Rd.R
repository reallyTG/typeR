library(ptw)


### Name: lcms
### Title: Parts of 3 proteomic LC-MS samples
### Aliases: lcms time mz lcms.pks
### Keywords: datasets

### ** Examples

## the lcms.pks object is generated in the following way:
## Not run: 
##D data(lcms)
##D pick.peaks <- function(x, span) {
##D   span.width <- span * 2 + 1
##D   loc.max <- span.width + 1 -
##D       apply(embed(x, span.width), 1, which.max)
##D   loc.max[loc.max == 1 | loc.max == span.width] <- NA
##D   
##D   pks <- loc.max + 0:(length(loc.max)-1)
##D   pks <- pks[!is.na(pks)]
##D   pks.tab <- table(pks)
##D   
##D   pks.id <- as.numeric(names(pks.tab)[pks.tab > span])
##D   
##D   cbind(rt = pks.id, I = x[pks.id])
##D }
##D 
##D ## bring all samples to the same scale, copied from ptw man page
##D lcms.scaled <- aperm(apply(lcms, c(1,3), 
##D                            function(x) x/mean(x) ), c(2,1,3))
##D lcms.s.z <- aperm(apply(lcms.scaled, c(1,3), 
##D                         function(x) padzeros(x, 250) ), c(2,1,3))
##D lcms.pks <- lapply(1:3,
##D                    function(ii) {
##D                      lapply(1:nrow(lcms.s.z[,,ii]),
##D                             function(jj)
##D                             cbind("mz" = jj,
##D                                   pick.peaks(lcms.s.z[jj,,ii], 5)))
##D                    })
## End(Not run)


