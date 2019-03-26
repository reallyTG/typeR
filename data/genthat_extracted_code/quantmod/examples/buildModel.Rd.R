library(quantmod)


### Name: buildModel
### Title: Build quantmod model given specified fitting method
### Aliases: buildModel
### Keywords: models

### ** Examples

## Not run: 
##D getSymbols('QQQQ',src='yahoo')
##D q.model = specifyModel(Next(OpCl(QQQQ)) ~ Lag(OpHi(QQQQ),0:3))
##D buildModel(q.model,method='lm',training.per=c('2006-08-01','2006-09-30'))
## End(Not run)



