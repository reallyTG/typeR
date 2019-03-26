library(PottsUtils)


### Name: getNC
### Title: Calculate the Normalizing Constant of a Simple Potts Model
### Aliases: getNC
### Keywords: distribution

### ** Examples

  ## Not run: 
##D   #Example 1: Calculate the normalizing constant of a simple Potts model
##D   #           with the neighborhood structure corresponding to a
##D   #           first-order Markov random field defined on a
##D   #           3*3 2D graph. The number of colors is 2 and beta=2.
##D   #           Use 11 subbetas evenly distributed between 0 and 2.
##D   #           The sampling algorithm is Swendsen-Wang with 10000
##D   #           iterations and 1000 burn-in. 
##D  
##D   edges <- getEdges(mask=matrix(1,3,3), neiStruc=c(2,2,0,0))
##D   getNC(beta=2, subbetas=seq(0,2,by=0.2), nvertex=3*3, ncolor=2,
##D         edges, algorithm="S", n=10000, burn=1000)
##D   
## End(Not run)




