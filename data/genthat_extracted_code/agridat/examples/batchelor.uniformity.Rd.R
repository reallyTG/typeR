library(agridat)


### Name: batchelor.uniformity
### Title: Uniformity trials of apples, lemons, oranges, and walnuts
### Aliases: batchelor.apple.uniformity batchelor.lemon.uniformity
###   batchelor.navel1.uniformity batchelor.navel2.uniformity
###   batchelor.valencia.uniformity batchelor.walnut.uniformity

### ** Examples

## Not run: 
##D   
##D   require(desplot)
##D   # Apple
##D   data(batchelor.apple.uniformity)
##D   desplot(yield~col*row, data=batchelor.apple.uniformity,
##D           aspect=840/128, tick=TRUE, # true aspect
##D           main="batchelor.apple.uniformity")
##D 
##D   # Lemon
##D   data(batchelor.lemon.uniformity)
##D   desplot(yield~col*row, data=batchelor.lemon.uniformity,
##D           aspect=624/336, # true aspect
##D           main="batchelor.lemon.uniformity")
##D 
##D   # Navel1 (Arlington)
##D   data(batchelor.navel1.uniformity)
##D   desplot(yield~col*row, batchelor.navel1.uniformity,
##D           aspect=1100/440, # true aspect
##D           main="batchelor.navel1.uniformity - Arlington")
##D 
##D   # Navel2 (Antelope)
##D   data(batchelor.navel2.uniformity)
##D   desplot(yield~col*row, data=batchelor.navel2.uniformity,
##D           aspect=726/330, # true aspect
##D           main="batchelor.navel2.uniformity - Antelope")
##D 
##D   # Valencia
##D   data(batchelor.valencia.uniformity)
##D   desplot(yield~col*row, data=batchelor.valencia.uniformity,
##D           aspect=440/264, # true aspect
##D           main="batchelor.valencia.uniformity")
##D 
##D   # Walnut
##D   data(batchelor.walnut.uniformity)
##D   desplot(yield~col*row, data=batchelor.walnut.uniformity,
##D           aspect=1600/500, # true aspect
##D           main="batchelor.walnut.uniformity")
##D 
## End(Not run)



