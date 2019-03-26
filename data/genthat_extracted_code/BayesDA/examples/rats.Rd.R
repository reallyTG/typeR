library(BayesDA)


### Name: rats
### Title: Tumor Incidence in Historical Control Groups and Current Group
###   of Rats
### Aliases: rats
### Keywords: datasets

### ** Examples

data(rats)
summary(rats)
# moment estimate of (alfa, beta) in beta distribution is (1.4, 8.6)
with(subset(rats, Current=="0"), hist( y/N, freq=FALSE))
plot(function(x) dbeta(x, 1.4, 8.6), from=0, to=1, col="red", add=TRUE)
# plotting posterior in same plot:
plot(function(x) dbeta(x, 5.4, 18.6), from=0, to=1, col="blue", add=TRUE)



