library(hypergeo)


### Name: buhring
### Title: Evaluation of the hypergeometric function using Buhring's method
### Aliases: buhring buhring_eqn11 buhring_eqn12 buhring_eqn5_factors
###   buhring_eqn5_series hypergeo_buhring buhring_eqn12
### Keywords: math

### ** Examples



# should be identical:
buhring_eqn11(n=0:10,S=1/2,A=1/2,B=1/3,C=pi)
buhring_eqn12(n=0:10,S=1/2,A=1/2,B=1/3,C=pi)
# but differ in one element


a <- hypergeo(1/2,1/3,4,1+8i,maxiter=90)
b <- hypergeo_buhring(1/2,1/3,4,1+8i,maxiter=90)
# should be identical but are not 


# following command fails due to numerical instability:
## Not run: 
##D hypergeo_buhring(1/2,1/3,pi,z=1/2 + 1i*sqrt(3)/2)
## End(Not run)




