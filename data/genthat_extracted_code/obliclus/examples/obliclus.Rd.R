library(obliclus)


### Name: obliclus
### Title: A cluster-based factor rotation
### Aliases: obliclus

### ** Examples

##loading matrix for rotation (Perfect simple structure)
##Find optimal T and U (cluster parameter) simultaneously
A <- matrix(c(.8, 0, 0,
              .7, 0, 0,
               0,.8, 0,
               0,.7, 0,
               0, 0,.8,
               0, 0,.7), 6, 3, byrow=TRUE)

(out <- obliclus(A, N.random=1)) ##Using many random starts is recommended.


##loading matrix for rotation (More complex structure)
##Find optimal T based on the information on cluster structure
A <- matrix(c(   1,   0,   0,
                 0,   1,   0,
                 0,   0,   1,
               0.9, 0.6,-0.3,
              -0.3, 0.9, 0.6,
               0.6,-0.3, 0.9) ,6,3,byrow=TRUE)
cluster <- c(1,2,3,4,4,4)
(out <- obliclus(A, cluster=cluster, fixed=TRUE, N.cluster=4))



