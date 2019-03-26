library(fastGraph)


### Name: shadeDist
### Title: Displays Area Under Curve of Probability Density Function
### Aliases: shadeDist
### Keywords: probability density function

### ** Examples

shadeDist( 1.96 ) # Shows P(Z<1.96) where Z ~ N(0,1)
shadeDist( 1.96, "dnorm", 0, 1 ) # Same as above.

shadeDist( 1.96, lower.tail = FALSE ) # Shows P(Z>1.96) where Z ~ N(0,1)

shadeDist( c( 40, 60 ), , 50, 10, lower.tail = FALSE ) # Shows P(40<X<60) where X~N(mu=50,sigma=10)

# Tail probabilities.
shadeDist( c( 40, 60 ), "dnorm", 50, 10, col=c("purple", "lightgreen") ) 

shadeDist( 5.8, "dchisq", 4, lower.tail = FALSE ) # Chi-squared distribution with 4 d.f.

shadeDist( c( -1.3, 1.3 ), "dt", 13 ) # t with 13 d.f.

shadeDist( 1.73, "dt", 15, lower.tail = FALSE, col=c("blue", "red") ) # t with 15 d.f.

shadeDist( 1.73, "dt", 15, 3, lower.tail = FALSE ) # t with 15 d.f. and non-centrality parameter=3

# P(X>6) where X~Poisson(mu=3.2)
shadeDist( 6, "dpois", 3.2, lower.tail = FALSE, col=c("brown", "yellow") ) 

shadeDist( c( 2, 5 ), "dbinom", 10, 0.4 ) # Binomial(n=10, p=0.4) probabilities

# Probabilities for sample proportion, phat = X/n, where X~Binomial(n=10, p=0.4)
shadeDist( 0.3, "dprop", 20, 0.4 ) 



