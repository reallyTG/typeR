library(copula)


### Name: printNacopula
### Title: Print Compact Overview of a Nested Archimedean Copula
###   ("nacopula")
### Aliases: printNacopula show,nacopula-method
### Keywords: utilities

### ** Examples

C8 <- onacopula("F", C(1.9, 1,
                       list(K1 = C(5.7, c(2,5)),
                            abc= C(5.0, c(3,4,6),
                                   list(L2 = C(11.5, 7:8))))))
C8 # -> printNacopula(C8)
printNacopula(C8, delta=10)
printNacopula(C8, labelKids=TRUE)



