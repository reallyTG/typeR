library(FactoClass)


### Name: kmeansW
### Title: K-means with Weights of the Elements
### Aliases: kmeansW kmnsw
### Keywords: multivariate cluster

### ** Examples

 data(Bogota)
 ac.bog <- Bogota[-1]
 il.bog <- Bogota[ 1]
 
 acs <- dudi.coa( ac.bog, nf=6 , scannf = FALSE )
 
 kmeansW( acs$li, 7, acs$lw )
 



