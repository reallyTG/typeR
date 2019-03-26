library(seewave)


### Name: discrets
### Title: Time series discretisation
### Aliases: discrets
### Keywords: ts

### ** Examples

# a random variable
discrets(rnorm(30))
discrets(rnorm(30),symb=3)
# a frequency spectrum
data(tico)
spec1<-spec(tico,f=22050,at=0.2,plot=FALSE)
discrets(spec1[,2])



