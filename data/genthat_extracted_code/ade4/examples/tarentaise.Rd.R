library(ade4)


### Name: tarentaise
### Title: Mountain Avifauna
### Aliases: tarentaise
### Keywords: datasets

### ** Examples

data(tarentaise)
coa1 <- dudi.coa(tarentaise$ecol, sca = FALSE, nf = 2)
s.class(coa1$li, tarentaise$envir$alti, wt = coa1$lw)
## Not run: 
##D acm1 <- dudi.acm(tarentaise$envir, sca = FALSE, nf = 2)
##D s.class(acm1$li, tarentaise$envir$alti)
## End(Not run)



