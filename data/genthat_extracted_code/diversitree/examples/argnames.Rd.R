library(diversitree)


### Name: argnames
### Title: Argument Names for Vector-Argument Functions
### Aliases: argnames argnames<- argnames.constrained
###   argnames<-.constrained
### Keywords: programming

### ** Examples

## Same example likelihood function as for make.bisse:
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(4)
phy <- tree.bisse(pars, max.t=30, x0=0)
f <- make.bisse(phy, phy$tip.state)

argnames(f) # Canonical argument names (set by default)
## Names that might be more informative for a tall/short state
argnames(f) <- c("l.tall", "l.short", "m.tall", "m.short",
                 "q.tall.short", "q.short.tall")
argnames(f)




