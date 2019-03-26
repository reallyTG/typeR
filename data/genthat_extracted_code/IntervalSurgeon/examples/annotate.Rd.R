library(IntervalSurgeon)


### Name: annotate
### Title: Annotate one set of intervals with the names of those which
###   intersect with the other
### Aliases: annotate

### ** Examples

annotate(rbind(A=c(1, 100), B=c(50, 100)), rbind(a=c(1, 2), b=c(49, 51), c=c(50, 200)))
annotate(rbind(A=c(1, 100), B=c(50, 100)), c(a=1, b=49, c=51, d=100))



