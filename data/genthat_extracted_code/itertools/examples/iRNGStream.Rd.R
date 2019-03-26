library(itertools)


### Name: iRNGStream
### Title: Iterators that support parallel RNG
### Aliases: iRNGStream iRNGSubStream
### Keywords: utilities

### ** Examples

it <- iRNGStream(313)
print(nextElem(it))
print(nextElem(it))

## Not run: 
##D library(foreach)
##D foreach(1:3, rseed=iRNGSubStream(1970), .combine='c') %dopar% {
##D   RNGkind("L'Ecuyer-CMRG") # would be better to initialize workers only once
##D   assign('.Random.seed', rseed, pos=.GlobalEnv)
##D   runif(1)
##D }
## End(Not run)



