library(HH)


### Name: matrix.trellis
### Title: Convert a one-dimensional trellis object to a two-dimensional
###   trellis object. This permits combineLimits and useOuterStrips to
###   work.
### Aliases: matrix.trellis as.matrix.trellis
### Keywords: dplot

### ** Examples

tmp <- data.frame(a=1:3,
                  b=c(4,5,7),
                  c=5:7,
                  d=c(8, 9, 12),
                  e=9:11)
tmp
a1 <- xyplot(a + b ~ c + d + e, data=tmp, outer=TRUE,
             main="a1")
a1
dim(a1)
a2 <- xyplot(a + b ~ c + d + e, data=tmp, outer=TRUE,
             scales=list(relation="free"), main="a2")
a2
dim(a2)
try(combineLimits(a2))
combineLimits.trellisvector(a2)
combineLimits.trellisvector(update(a2, layout=c(3,2)))

a21 <- matrix.trellis(a2, ncol=3, nrow=2, byrow=TRUE)
a21 <- update(a21, main="a21")
a21
dim(a21)
a21$x.scales$at
combineLimits(a21)

a22 <- update(a21, main="a22")
a22$x.scales$at <- list(FALSE, FALSE, FALSE, NULL, NULL, NULL)
a22$y.scales$at <- list(FALSE, NULL, NULL, FALSE, NULL, NULL)
a22

a23 <- useOuterStrips(combineLimits(a21))
a23 <- update(a23, main="a23")
a23
a23$condlevels
a23$condlevels <- list(letters[3:5], letters[1:2])
a23

a24 <- resizePanels(update(a23, main="a24"), h=c(3,4), w=c(3,5,3))
a24

a25 <- update(a23, xlab=letters[3:5], ylab.right=letters[1:2],
              xlab.top="column variables",
              ylab="row variables",
              scales=list(x=list(alternating=1), y=list(alternating=2)),
              main="a25: what I want\nxyplot(a + b ~ c + d + e, data=tmp, outer=TRUE)\nto produce.")
a25

as.matrix(a1)
as.matrix(a1, yname="abcd")
as.matrix(a1, yname="abcd", row=TRUE)




