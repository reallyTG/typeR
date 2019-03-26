library(quantmod)


### Name: specifyModel
### Title: Specify Model Formula For quantmod Process
### Aliases: specifyModel
### Keywords: models

### ** Examples

## Not run: 
##D # if QQQQ is not in the Global environment, an attempt will be made
##D # to retrieve it from the source specified with getSymbols.Default
##D 
##D specifyModel(Next(OpCl(QQQQ)) ~ Lag(OpHi(QQQQ),0:3) + Hi(DIA))
## End(Not run)



