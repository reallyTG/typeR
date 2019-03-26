library(sampSurf)


### Name: bufferedTract
### Title: Generate Objects of Class "'bufferedTract'"
### Aliases: bufferedTract
### Keywords: ~kwd1 ~kwd2

### ** Examples

tract = Tract(c(x=20,y=20), cellSize=0.25) 
buffTr = bufferedTract(4, tract)
summary(buffTr)
buffTr
plot(buffTr, axes=TRUE)



