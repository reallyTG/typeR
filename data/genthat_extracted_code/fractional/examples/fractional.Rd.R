library(fractional)


### Name: fractional
### Title: Representation of a numeric vector in vulgar fractional form
### Aliases: as.character.fractional fractional print.charFrac
###   print.fractional

### ** Examples

(M <- solve(cbind(1, contr.helmert(5))))
(Mf <- fractional(M))     ## print method right justifies
(Mc <- as.character(Mf))  ## print method left justifies
(Mn <- numerical(Mc))
set.seed(123)
u <- matrix(runif(10), 2, 5)
(uf <- fractional(u))
(us <- fractional(u, sync = TRUE))  ## may look different!
unfractional(uf) - unfractional(us)  ## rational approximation errors



