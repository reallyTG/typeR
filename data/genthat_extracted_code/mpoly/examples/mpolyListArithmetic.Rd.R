library(mpoly)


### Name: mpolyListArithmetic
### Title: Element-wise arithmetic with vectors of multivariate
###   polynomials.
### Aliases: mpolyListArithmetic +.mpolyList -.mpolyList *.mpolyList

### ** Examples


( ms1 <- mp( c('x + 1', 'x + 2') ) )
( ms2 <- mp( c('x + 1', 'y + 2') ) )
ms1 + ms2
ms1 - ms2
ms1 * ms2




