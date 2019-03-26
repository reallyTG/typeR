library(fastGraph)


### Name: plotDist
### Title: Plotting of Statistical Distributions
### Aliases: plotDist
### Keywords: plot probability density function cumulative distribution
###   function

### ** Examples

# Plots standard normal density in black, t density with 3 d.f. in red, and
# non-central t density with 3 d.f. and non-centrality parameter=1.4 in green.
plotDist( "dnorm", 0, 1, "dt", 3, 0, "dt", 3, 1.4 ) 

# Plots normal approximation to Binomial(n=100, p=0.4).
plotDist( , 40, sqrt(100*0.4*0.6), "dbinom", 100, 0.4, col=c("blue", "hotpink") )

# Plots cumulative normal and Cauchy distribution functions.
plotDist( "pnorm", 50, 10, "pcauchy", 50, 10, col=c("purple","orange") )



