library(agridat)


### Name: immer.sugarbeet.uniformity
### Title: Uniformity trial of sugarbeets, measurements of yield, sugar,
###   purity
### Aliases: immer.sugarbeet.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(immer.sugarbeet.uniformity)
##D   dat <- immer.sugarbeet.uniformity
##D 
##D   # Immer numbers rows from the top
##D   require(desplot)
##D   desplot(yield~col*row, data=dat,
##D           aspect=110/348, tick=TRUE, flip=TRUE, # true aspect
##D           main="immer.sugarbeet.uniformity - yield")
##D   desplot(sugar~col*row, data=dat,
##D           aspect=110/348, tick=TRUE, flip=TRUE,
##D           main="immer.sugarbeet.uniformity - sugar")
##D   desplot(purity~col*row, data=dat,
##D           aspect=110/348, tick=TRUE, flip=TRUE,
##D           main="immer.sugarbeet.uniformity - purity")
##D   
##D   pairs(dat[,c('yield','sugar','purity')],
##D         main="immer.sugarbeet.uniformity")
##D 
## End(Not run) 



