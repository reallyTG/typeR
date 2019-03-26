library(ergm)


### Name: ergm.godfather
### Title: A function to apply a given series of changes to a network.
### Aliases: ergm.godfather

### ** Examples

data(florentine)
ergm.godfather(flomarriage~edges+absdiff("wealth")+triangles,
               changes=list(cbind(1:2,2:3),
                            cbind(3,5),
                            cbind(3,5),
                            cbind(1:2,2:3)),
               stats.start=TRUE)



