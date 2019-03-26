library(pomp)


### Name: dacca
### Title: Model of cholera transmission for historic Bengal.
### Aliases: dacca
### Keywords: models datasets

### ** Examples

pompExample(dacca)
plot(dacca)
#MLEs on the natural scale
coef(dacca)
#MLEs on the transformed scale
coef(dacca,transform=TRUE)
plot(simulate(dacca))



