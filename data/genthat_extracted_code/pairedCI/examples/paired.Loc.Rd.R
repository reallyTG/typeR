library(pairedCI)


### Name: paired.Loc
### Title: Confidence intervals for the ratio of locations of two paired
###   samples
### Aliases: paired.Loc
### Keywords: htest

### ** Examples


astra <- c(2.4, 4.8, 4, 4.9, 3.9, 4.1, 3.8, 3.5, 4.6, 2.9, 4.9, 3.7, 4.8, 3.7, 3.8, 4.1, 4.2, 4.3, 3.9, 3.8)

flame <- c(2.4, 4.8, 4, 4.7, 3.9, 4.2, 3.8, 3.3, 4.6, 3, 5, 3.6, 4.9, 3.8, 3.9, 4.6, 4.2, 4.4, 4, 3.4)

paired.Loc(astra, flame, conf.level=0.9, method="parametric")
paired.Loc(astra, flame, conf.level=0.9, method="nonparametric")




