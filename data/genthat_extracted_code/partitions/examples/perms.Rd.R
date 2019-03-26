library(partitions)


### Name: perms
### Title: Enumerate the permutations of a vector
### Aliases: perms plainperms
### Keywords: math

### ** Examples

summary(perms(5))

# Knuth's Figure 18:
matplot(t(apply(plainperms(4),2,order)),
        type='l', lty=1, lwd=5, asp=1,
        frame=FALSE, axes=FALSE, ylab="", col=gray((1:5)/5))






