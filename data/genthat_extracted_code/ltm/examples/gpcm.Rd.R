library(ltm)


### Name: gpcm
### Title: Generalized Partial Credit Model - Polytomous IRT
### Aliases: gpcm
### Keywords: multivariate regression

### ** Examples


## The Generalized Partial Credit Model for the Science data:
gpcm(Science[c(1,3,4,7)])

## The Generalized Partial Credit Model for the Science data,
## assuming equal discrimination parameters across items:
gpcm(Science[c(1,3,4,7)], constraint = "1PL")

## The Generalized Partial Credit Model for the Science data,
## assuming equal discrimination parameters across items
## fixed at 1:
gpcm(Science[c(1,3,4,7)], constraint = "rasch")

## more examples can be found at:
## http://wiki.r-project.org/rwiki/doku.php?id=packages:cran:ltm#sample_analyses




