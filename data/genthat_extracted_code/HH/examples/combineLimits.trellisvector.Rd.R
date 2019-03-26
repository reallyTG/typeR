library(HH)


### Name: combineLimits.trellisvector
### Title: Combine limits on a one-dimensional trellis object.
### Aliases: combineLimits.trellisvector
### Keywords: dplot

### ** Examples

tmp <- data.frame(a=1:3,
                  b=c(4,5,7),
                  c=5:7,
                  d=c(8, 9, 12),
                  e=9:11)
tmp

a2 <- xyplot(a + b ~ c + d + e, data=tmp, outer=TRUE,
             scales=list(relation="free"), main="a2")
a2
dim(a2)
combineLimits.trellisvector(a2)
a21 <- combineLimits.trellisvector(update(a2, layout=c(3,2)))
a21
dim(a21)



