library(copula)


### Name: pairsRosenblatt
### Title: Plots for Graphical GOF Test via Pairwise Rosenblatt Transforms
### Aliases: pairsRosenblatt pairsColList
### Keywords: hplot multivariate

### ** Examples

## 2-dim example {d = 2} ===============
##
## "t" Copula with 22. degrees of freedom; and (pairwise) tau = 0.5
nu <- 2.2 # degrees of freedom
## Define the multivariate distribution
tCop <- ellipCopula("t", param=iTau(ellipCopula("t", df=nu), tau = 0.5),
                    dim=2, df=nu)
set.seed(19)
X <- qexp(rCopula(n = 400, tCop))

## H0 (wrongly): a Normal copula, with correct tau
copH0 <- ellipCopula("normal", param=iTau(ellipCopula("normal"), tau = 0.5))

## create array of pairwise copH0-transformed data columns
cu.u <- pairwiseCcop(pobs(X), copula = copH0)

## compute pairwise matrix of p-values and corresponding colors
pwIT <- pairwiseIndepTest(cu.u, N=200) # (d,d)-matrix of test results

round(pmat <- pviTest(pwIT), 3) # pick out p-values
## .286 and .077
pairsRosenblatt(cu.u, pvalueMat= pmat)



### A shortened version of   demo(gof_graph) -------------------------------

N <- 32 ## too small, for "testing"; realistically, use a larger one:
if(FALSE)
N <- 100

## 5d Gumbel copula ##########

n <- 250 # sample size
d <- 5 # dimension
family <- "Gumbel" # copula family
tau <- 0.5
set.seed(17)
## define and sample the copula (= H0 copula), build pseudo-observations
cop <- getAcop(family)
th <- cop@iTau(tau) # correct parameter value
copH0 <- onacopulaL(family, list(th, 1:d)) # define H0 copula
U. <- pobs(rCopula(n, cop=copH0))

## create array of pairwise copH0-transformed data columns
cu.u <- pairwiseCcop(U., copula = copH0)

## compute pairwise matrix of p-values and corresponding colors
pwIT <- pairwiseIndepTest(cu.u, N=N, verbose=interactive()) # (d,d)-matrix of test results
round(pmat <- pviTest(pwIT), 3) # pick out p-values
## Here (with seed=1):  no significant ones, smallest = 0.0603

## Plots ---------------------

## plain (too large plot symbols here)
pairsRosenblatt(cu.u, pvalueMat=pmat, pch=".")

## with title, no subtitle
pwRoto <- "Pairwise Rosenblatt transformed observations"
pairsRosenblatt(cu.u, pvalueMat=pmat, pch=".", main=pwRoto, sub=NULL)

## two-line title including expressions, and centered
title <- list(paste(pwRoto, "to test"),
              substitute(italic(H[0]:C~~bold("is Gumbel with"~~tau==tau.)),
                         list(tau.=tau)))
line.main <- c(4, 1.4)
pairsRosenblatt(cu.u, pvalueMat=pmat, pch=".",
                main=title, line.main=line.main, main.centered=TRUE)

## Q-Q plots -- can, in general, better detect outliers
pairsRosenblatt(cu.u, pvalueMat=pmat, method="QQchisq", cex=0.2)



