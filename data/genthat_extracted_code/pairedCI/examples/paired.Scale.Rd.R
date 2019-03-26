library(pairedCI)


### Name: paired.Scale
### Title: Confidence intervals for the ratio of scales of two paired
###   samples
### Aliases: paired.Scale
### Keywords: htest

### ** Examples


astra <- c(2.4, 4.8, 4, 4.9, 3.9, 4.1, 3.8, 3.5, 4.6, 2.9, 4.9, 3.7, 4.8, 3.7, 3.8, 4.1, 4.2, 4.3, 3.9, 3.8)

flame <- c(2.4, 4.8, 4, 4.7, 3.9, 4.2, 3.8, 3.3, 4.6, 3, 5, 3.6, 4.9, 3.8, 3.9, 4.6, 4.2, 4.4, 4, 3.4)


paired.Scale(astra, flame, conf.level=0.9, method="parametric")
paired.Scale(astra, flame, conf.level=0.9, method="nonparametric")




