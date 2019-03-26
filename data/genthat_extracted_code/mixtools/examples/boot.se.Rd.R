library(mixtools)


### Name: boot.se
### Title: Performs Parametric Bootstrap for Standard Error Approximation
### Aliases: boot.se
### Keywords: file

### ** Examples

## Bootstrapping standard errors for a regression mixture case.

data(NOdata)
attach(NOdata)
set.seed(100)
em.out <- regmixEM(Equivalence, NO, arbvar = FALSE)
out.bs <- boot.se(em.out, B = 10, arbvar = FALSE)
out.bs




