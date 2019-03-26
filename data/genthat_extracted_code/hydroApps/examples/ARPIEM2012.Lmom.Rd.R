library(hydroApps)


### Name: ARPIEM2012.Lmom
### Title: Calcolo degli L-momenti
### Aliases: ARPIEM2012.Lmom.sample ARPIEM2012.Lmom.reg

### ** Examples

## esempio campionario
require(nsRFA)

x <- rnorm(30) # random sample
res <- ARPIEM2012.Lmom.sample(x)
print(res)

## Not run: 
##D ## esempio regionale
##D tab <- read.table("input_descrittori.txt", header=T, sep=";")
##D descr <- tab[, "valore"]
##D names(descr) <- tab[, "denominazione"]
##D res <- ARPIEM2012.Lmom.reg(descr)
##D print(res)
## End(Not run)




