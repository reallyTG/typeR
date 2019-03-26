library(pracma)


### Name: bernoulli
### Title: Bernoulli Numbers and Polynomials
### Aliases: bernoulli
### Keywords: specfun

### ** Examples

bernoulli(10)
# 1.00000000 -0.50000000  0.16666667  0.00000000 -0.03333333
# 0.00000000  0.02380952  0.00000000 -0.03333333  0.00000000  0.07575758
                #
## Not run: 
##D x1 <- linspace(0.3, 0.7, 2)
##D y1 <- bernoulli(1, x1)
##D plot(x1, y1, type='l', col='red', lwd=2,
##D      xlim=c(0.0, 1.0), ylim=c(-0.2, 0.2),
##D      xlab="", ylab="", main="Bernoulli Polynomials")
##D grid()
##D xs <- linspace(0, 1, 51)
##D lines(xs, bernoulli(2, xs), col="green", lwd=2)
##D lines(xs, bernoulli(3, xs), col="blue", lwd=2)
##D lines(xs, bernoulli(4, xs), col="cyan", lwd=2)
##D lines(xs, bernoulli(5, xs), col="brown", lwd=2)
##D lines(xs, bernoulli(6, xs), col="magenta", lwd=2)
##D legend(0.75, 0.2, c("B_1", "B_2", "B_3", "B_4", "B_5", "B_6"),
##D        col=c("red", "green", "blue", "cyan", "brown", "magenta"),
##D        lty=1, lwd=2)
##D   
## End(Not run)



