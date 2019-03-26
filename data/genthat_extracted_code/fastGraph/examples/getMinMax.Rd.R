library(fastGraph)


### Name: getMinMax
### Title: Finds a Reasonable Domain for Plotting a Graph
### Aliases: getMinMax
### Keywords: probability density function

### ** Examples

getMinMax(  , , "dnorm", 20, 5  ) # Normal(mu=20, sigma=5)

# Standard normal, and t with 4 degrees of freedom
getMinMax(  , , "dnorm", 0, 1, "dt", 4, 0 ) 

# Standard normal, central t with 4 d.f., and t with 4 d.f. and non-centrality parmater = 1.2
getMinMax(  , , "dnorm", 0, 1, "dt", 4, 0, "dt", 4, 1.2 ) 

# Force minimum to be -3.
getMinMax( -3, , "dnorm", 0, 1 )

# Force maximum to be 3.
getMinMax( , 3, "dnorm", 0, 1 )




