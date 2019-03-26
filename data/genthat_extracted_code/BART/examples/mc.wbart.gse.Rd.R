library(BART)


### Name: mc.wbart.gse
### Title: Global SE variable selection for BART with parallel computation
### Aliases: mc.wbart.gse
### Keywords: nonproportional hazards variable selection

### ** Examples

## Not run: 
##D 
##D library(ElemStatLearn)
##D 
##D data(phoneme)
##D 
##D x.train <- matrix(NA, nrow=4509, ncol=257)
##D     
##D dimnames(x.train)[[2]] <- c(paste0('x.', 1:256), 'speaker')
##D     
##D x.train[ , 257] <- as.numeric(phoneme$speaker)
##D 
##D for(j in 1:256) x.train[ , j] <- as.numeric(phoneme[ , paste0('x.', j)])
##D 
##D gse <- mc.wbart.gse(x.train, as.numeric(phoneme$g), mc.cores=5, seed=99)
##D 
##D ## important variables
##D dimnames(x.train)[[2]][gse$which]
##D     
## End(Not run)



