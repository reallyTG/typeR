library(gwerAM)


### Name: gwerAM
### Title: Calculates signifance thresholds for mixed-model association
###   mapping
### Aliases: gwerAM

### ** Examples


data(maizeA)
data(maizeQ)
data(maizeW)
data(maizevarianceA)
data(maizevarianceE)

gwerAM(A=maizeA,
       Q=maizeQ[,-ncol(maizeQ)],
       W=maizeW[,1:10],
       varianceA=maizevarianceA,
       varianceE=maizevarianceE,
       Nrsim=1000,
       k=c(0,1,2,5),
       alpha=c(0.01,0.05))

## Not run: 
##D The last column of maizeQ was removed in this example, as the 
##D columns sum up to one and, thus, are linearly dependent and 
##D confounded with the common intercept, whereas the columns of 
##D Q have to be linearly independent. Note that dropping the last
##D column of maizeQ does not alter the model.
## End(Not run)
## Not run: 
##D In this example, only the first ten markers were included to
##D reduce the computational effort. You should run it with all your markers.
## End(Not run)



