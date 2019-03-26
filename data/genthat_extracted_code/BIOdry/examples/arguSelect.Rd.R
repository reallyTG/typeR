library(BIOdry)


### Name: arguSelect
### Title: Argument selection
### Aliases: arguSelect

### ** Examples


##Multilevel ecological data series of tree-ring widths:
data(Prings05,envir = environment())
## Radial increments measured on 2003:
data(Pradii03,envir = environment())    

## Selection of arguments in some functions:
ar1 <- arguSelect(fun = c('amod'),
                  only.dup = TRUE,
                  mp = c(0.5,1),
                  rf.t = 2003)
str(ar1)

ar2 <- arguSelect(fn = 'amod',
                  only.dup = TRUE,
                  mp = c(0.5,1),
                  rf.t = 2003)
str(ar2)
ar3 <- arguSelect(rd = Prings05,
                  fn = 'amod',
                  only.dup = TRUE,
                  mp = c(0.5,1),
                  rf.t = 2003)
str(ar3)

ar4 <- arguSelect(rd = Prings05,
                  fun = 'scacum',
                  sc.c = Pradii03,
                  MoreArgs = list(only.dup = TRUE,
                                  mp = c(0.5,1),
                                  rf.t = 2003))
str(ar4)

ar5 <- arguSelect(rd = Prings05,
                  fun = 'scacum',
                  ref = Pradii03,
                  rf.t = rep(2003:2011),
                  MoreArgs = list(only.dup = TRUE,
                                  mp = c(0.5,1)))
str(ar5)    




