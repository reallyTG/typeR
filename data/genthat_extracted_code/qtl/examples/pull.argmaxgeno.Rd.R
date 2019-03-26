library(qtl)


### Name: pull.argmaxgeno
### Title: Pull out the results of the Viterbi algorithm from a cross
### Aliases: pull.argmaxgeno
### Keywords: utilities

### ** Examples

data(listeria)
listeria <- argmax.geno(listeria, step=1, stepwidth="max")
amg <- pull.argmaxgeno(listeria, chr=c(5,13), include.pos.info=TRUE, rotate=TRUE)
amg[1:5,1:10]



