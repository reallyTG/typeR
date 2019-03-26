library(NPflow)


### Name: Flimited
### Title: Compute a limited F-measure
### Aliases: Flimited

### ** Examples

pred <- c(rep(1, 5),rep(2, 8),rep(3,10))
ref <- c(rep(1, 5),rep(c(2,3), 4),rep(c(3,2),5))
FmeasureC(pred, ref)
Flimited(6, pred, ref)




