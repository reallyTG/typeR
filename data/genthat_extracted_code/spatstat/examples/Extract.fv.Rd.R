library(spatstat)


### Name: Extract.fv
### Title: Extract or Replace Subset of Function Values
### Aliases: [.fv [<-.fv $<-.fv
### Keywords: spatial manip

### ** Examples

 K <- Kest(cells)

 # discard the estimates of K(r) for r  > 0.1
 Ksub <- K[K$r <= 0.1, ]

 # extract the border method estimates
 bor <- K[ , "border", drop=TRUE]
 # or equivalently
 bor <- K$border

 # remove the border-method estimates
 K$border <- NULL
 K



