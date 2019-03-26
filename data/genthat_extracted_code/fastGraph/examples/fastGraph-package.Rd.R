library(fastGraph)


### Name: fastGraph-package
### Title: Fast Drawing and Shading of Graphs of Statistical Distributions
### Aliases: fastGraph-package fastGraph
### Keywords: plot

### ** Examples

# Plots cumulative distribution functions of a standard normal, a central t with 4 d.f., 
# and a t with 4 d.f. and non-centrality parameter = 1.3 in black, red, and green, respectively. 
plotDist( "pnorm", 0, 1, "pt", 4, 0, "pt", 4, 1.3 )

# Plots Binomial(n=100,p) density functions, where p=0.4, 0.5, and 0.7
# in colors black, red, and green, respectively.
plotDist( "dbinom", 100, 0.4, "dbinom", 100, 0.5, "dbinom", 100, 0.7 ) 

# Shows P(|T| > 1.8), where T is t distributed with 9 d.f.
shadeDist( c(-1.8, 1.8), "dt", 9 ) 

# Shows P(X > 8), where X ~ Poisson(mean=6).
shadeDist( 8, "dpois", 6, lower.tail=FALSE, col=c("purple","green") ) 

# Graphs line of simple linear regression model and states equation.
plotLine( c(-5,6,2,9,-11), c(-7,17,21,29,8), digits.intercept=3, digits.slope=4 )  

# Finds a reasonable domain when plotting a Normal(mean=20, sd=5) density function.
getMinMax( , , "dnorm", 20, 5 )



