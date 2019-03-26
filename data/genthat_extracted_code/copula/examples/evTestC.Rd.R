library(copula)


### Name: evTestC
### Title: Large-sample Test of Multivariate Extreme-Value Dependence
### Aliases: evTestC
### Keywords: htest multivariate

### ** Examples

## Do these data come from an extreme-value copula?
evTestC(rCopula(200, gumbelCopula(3)))
evTestC(rCopula(200, claytonCopula(3)))

## Three-dimensional examples
evTestC(rCopula(200, gumbelCopula(3, dim=3)))
evTestC(rCopula(200, claytonCopula(3, dim=3)))
## Don't show: 
 set.seed(101)
 G.t <- evTestC(rCopula(200, gumbelCopula(3, dim=3)))
 C.t <- evTestC(rCopula(200, claytonCopula(3, dim=3)))
 eT3 <- evTestC(rCopula(200, tevCopula(.8, df=3)))
 stopifnot(all.equal(G.t$p.value, 0.1543,       tolerance=.001),
           all.equal(C.t$p.value, 4995/9999990, tolerance= 1e-7),
           all.equal(eT3$p.value, 0.407092907092907, tolerance= 1e-7))
## End(Don't show)



