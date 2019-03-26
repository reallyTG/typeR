library(ssym)


### Name: ncs
### Title: Tool to build the basis matrix and the penalty matrix of natural
###   cubic splines.
### Aliases: ncs

### ** Examples

n <- 300
t <- sort(round(runif(n),digits=1))

t2 <- ncs(t,all.knots=TRUE)
N <- attr(t2, "N") ## Basis Matrix
M <- attr(t2, "K") ## Penalty Matrix
knots <- attr(t2, "knots") ## Set of knots



