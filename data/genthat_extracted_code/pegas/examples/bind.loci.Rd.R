library(pegas)


### Name: bind.loci
### Title: Bind Loci Objects
### Aliases: bind.loci rbind.loci cbind.loci
### Keywords: manip

### ** Examples

a <- as.loci(data.frame(x = "A/a", y = 1), col.loci = 1)
b <- as.loci(data.frame(y = 2, x = "A/A"), col.loci = 2)
## rbind.loci reorders the columns if necessary:
str(rbind(a, b))
## cbind sets "locicol" correctly:
str(cbind(a, b))
str(cbind(b, a))
## Unexpected result...
str(cbind(a, data.frame(z = 10)))
## ... bypass the generic:
str(pegas:::cbind.loci(a, data.frame(z = 10)))
## ... or much better: a$z <- 10
## Here "locicol" is not correct...
str(pegas:::cbind.loci(z = 10, a))
## ... instead
str(pegas:::cbind.loci(data.frame(z = 10), a))



