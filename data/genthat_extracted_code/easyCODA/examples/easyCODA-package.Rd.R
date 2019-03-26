library(easyCODA)


### Name: easyCODA-package
### Title: Compositional Data Analysis in Practice
### Aliases: easyCODA-package
### Keywords: package

### ** Examples

# Roman cups glass compositions
data(cups)
# unweighted logratio analysis
cups.uLRA <- LRA(cups, weight=FALSE)
PLOT.LRA(cups.uLRA)
# weighted logratio analysis
cups.wLRA <- LRA(cups)
PLOT.LRA(cups.wLRA)
# author data set from the ca package
data(author)
which(author == 0, arr.ind = TRUE)
# row 5 (Farewell to Arms) and col 17 (Q) has a zero
# replace it with 0.5 for the logratio analysis
author[5,17] <- 0.5
# LRA (weighted by default)
# Here the ca plot function plot.ca is used
plot(LRA(author))



