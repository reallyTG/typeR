library(freqweights)


### Name: quickround
### Title: Round data sets
### Aliases: quickround

### ** Examples

quickround(iris,0.2)
quickround(iris[,1:3],c(0.2,0.5,1.0))

tfq <- tablefreq(iris, vars=c("Sepal.Length","Species"))
a <- quickround(tfq, c(0.3, NA, NA))
b <- tablefreq(a, freq="freq")
b



