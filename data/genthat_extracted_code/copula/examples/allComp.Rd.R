library(copula)


### Name: allComp
### Title: All Components of a (Inner or Outer) Nested Archimedean Copula
### Aliases: allComp
### Keywords: manip utilities

### ** Examples

 C3 <- onacopula("AMH", C(0.7135, 1, C(0.943, 2:3)))
 allComp(C3) # components are 1:3
 allComp(C3@childCops[[1]]) # for the child, only  (2, 3)



