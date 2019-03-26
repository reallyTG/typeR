library(hwde)


### Name: mendelABC
### Title: Mendel's F2 trifactorial data for seed shape (A: round or
###   wrinkled), cotyledon color (B: albumen yellow or green), and seed
###   coat color (C: grey-brown or white)
### Aliases: mendelABC
### Keywords: datasets

### ** Examples

## Lay table out as a 3D array, as in Fisher (1936)
abc <- aperm(array(mendelABC[,4], dim=c(3,3,3)), c(1,3,2))
dimnames(abc) <- list(B=c('BB','Bb','bb'), 
                      A=c('AA','Aa','aa'),
                      C=c('CC','Cc','cc'))
abc
## Fit Hardy-Weinberg disequilibium model
hwde(mendelABC, loci=c("seedshape","cotylcolor","coatcolor"))



