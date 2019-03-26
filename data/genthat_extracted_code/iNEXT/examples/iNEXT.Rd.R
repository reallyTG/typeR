library(iNEXT)


### Name: iNEXT
### Title: iNterpolation and EXTrapolation of Hill number
### Aliases: iNEXT

### ** Examples

## example for abundance based data (list of vector)
data(spider)
out1 <- iNEXT(spider, q=0, datatype="abundance")
out1$DataInfo # showing basic data information.
out1$AsyEst # showing asymptotic diversity estimates.
out1$iNextEst # showing diversity estimates with rarefied and extrapolated.

## example for abundance based data (data.frame)
data(bird)
out2 <- iNEXT(bird, q=0, datatype="abundance")
ggiNEXT(out2)

## example for incidence frequencies based data (list of data.frame)
data(ant)
t <- round(seq(10, 500, length.out=20))
out3 <- iNEXT(ant$h500m, q=1, datatype="incidence_freq", size=t, se=FALSE)
out3$iNextEst




