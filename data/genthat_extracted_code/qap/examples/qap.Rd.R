library(qap)


### Name: qap
### Title: Solve Quadratic Assignment Problems (QAP)
### Aliases: qap qap.obj
### Keywords: optim

### ** Examples

## load the had12 QAPLIB problem
p <- read_qaplib(system.file("qaplib", "had12.dat", package="qap"))
p


## run 1 repetitions verbose
a <- qap(p$A, p$B, verbose = TRUE)
a

## compare with known optimum (gap, % above optimum)
(attr(a, "obj") - p$opt)/p$opt * 100

## run more repetitions quietly
a <- qap(p$A, p$B, rep = 100)
a

## compare with known optimum (gap, % above optimum)
(attr(a, "obj") - p$opt)/p$opt * 100



