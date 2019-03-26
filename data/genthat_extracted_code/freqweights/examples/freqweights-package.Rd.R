library(freqweights)


### Name: freqweights-package
### Title: Working with frequency tables
### Aliases: freqweights-package freqweights
### Keywords: package

### ** Examples

tablefreq(iris)
lmfreq(Sepal.Length ~ Petal.Length, tablefreq(iris))
hclustvfreq(tablefreq(iris[,1:4]))



