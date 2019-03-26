library(ptw)


### Name: gaschrom
### Title: 16 calibration GC traces
### Aliases: gaschrom gaschrom.st
### Keywords: datasets

### ** Examples

data(gaschrom)

## the gaschrom.st object has been generated in the following way:
## Not run: 
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
##D gaschrom <- t(apply(gaschrom, 1, baseline.corr))
##D gaschrom.st <- lapply(1:nrow(gaschrom), 
##D                       function(ii) 
##D                       pick.peaks(gaschrom[ii,], span = 11))
##D ## remove peaks with an intensity below 10
##D gaschrom.st <- lapply(gaschrom.st,
##D                       function(pk)
##D                       pk[pk[,2] >= 10,])
## End(Not run)
plot(gaschrom[1,], type = "l", xlim = c(3000, 3500), ylim = c(0, 200))
abline(h = 10, lty = 2, col = 2)
abline(v = gaschrom.st[[1]], col = 4)



