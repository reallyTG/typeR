library(ssdtools)


### Name: pareto
### Title: Pareto Distribution
### Aliases: pareto dpareto qpareto ppareto rpareto

### ** Examples

x <- rpareto(1000,1,0.1)
hist(log(x),freq=FALSE,col='gray',border='white')
hist(x,freq=FALSE,col='gray',border='white')
curve(dpareto(x,1,0.1),add=TRUE,col='red4',lwd=2)



