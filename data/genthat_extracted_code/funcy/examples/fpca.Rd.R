library(funcy)


### Name: fpca
### Title: Functional principal component analysis
### Aliases: fpca

### ** Examples

##Generate a regular dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=40, timeNr=15, reg=TRUE)

##Execute functional principal component analysis
res <- fpca(Data(ds))
matplot(res$base,type='l')

##Generate an irregular dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=30, k=5, timeNrMin=5, timeNrMax=7, reg=FALSE)

##Execute functional principal component analysis
res <- fpca(Data(ds))
matplot(res$base, type='l', main="First 4 basis functions.")



