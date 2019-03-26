library(copula)


### Name: nesdepth
### Title: Nesting Depth of a Nested Archimedean Copula ("nacopula")
### Aliases: nesdepth
### Keywords: utilities

### ** Examples

F2 <- onacopula("F", C(1.9, 1, C(4.5, c(2,3))))
F2
F3 <- onacopula("Clayton", C(1.5, 3:1,
                             C(2.5, 4:5,
                               C(15, 9:6))))
nesdepth(F2) # 2
nesdepth(F3) # 3
## Don't show: 
stopifnot(identical(nesdepth(F2), 2L),
          identical(nesdepth(F3), 3L),
          identical(nesdepth(onacopula("Gumbel", C(1.5, 3:1))), 1L))
## End(Don't show)



