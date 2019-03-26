library(diversitree)


### Name: set.defaults
### Title: Set Default Arguments of a Function
### Aliases: set.defaults
### Keywords: programming

### ** Examples

pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4)
phy <- tree.bisse(pars, max.t=30, x0=0)
lik <- make.bisse(phy, phy$tip.state)

## default arguments:
args(lik)

lik.no.cond <- set.defaults(lik, condition.surv=FALSE)
args(lik.no.cond)

## Multiple arguments at once:
lik2 <- set.defaults(lik, root=ROOT.GIVEN, root.p=c(0, 1))
args(lik2)

## Equivalently (using alist, not list -- see ?alist)
defaults <- alist(root=ROOT.GIVEN, root.p=c(0, 1))
lik3 <- set.defaults(lik, defaults=defaults)
identical(lik2, lik3)



