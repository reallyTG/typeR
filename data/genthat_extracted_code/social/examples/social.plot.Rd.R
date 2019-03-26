library(social)


### Name: social.plot
### Title: Social scatterplot
### Aliases: social.plot

### ** Examples

A = matrix(c(0,1,0,1,0,
             1,0,0,1,1,
             0,0,0,1,1,
             1,1,1,0,0,
             0,1,1,0,0), nrow=5)
S = social.cor.matrix(A)
x = rnorm(nrow(A))
social.plot(x, S, ylim=c(min(x),max(x)), xlab="x", ylab="Socially lagged x")
abline(0, 1, lty=2)




