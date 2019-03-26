library(quantmod)


### Name: tradeModel
### Title: Simulate Trading of Fitted quantmod Object
### Aliases: tradeModel
### Keywords: models

### ** Examples

## Not run: 
##D m <- specifyModel(Next(OpCl(QQQQ)) ~ Lag(OpHi(QQQQ)))
##D m.built <- buildModel(m,method='rpart',training.per=c('2007-01-01','2007-04-01'))
##D 
##D tradeModel(m.built)
##D tradeModel(m.built,leverage=2)
## End(Not run)



