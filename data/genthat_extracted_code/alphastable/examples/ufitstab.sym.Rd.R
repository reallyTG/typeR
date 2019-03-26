library(alphastable)


### Name: ufitstab.sym
### Title: ufitstab.sym
### Aliases: ufitstab.sym

### ** Examples

# By the following example, we apply the EM algorithm to n=50 iid realization of symmetric
# stable distribution with parameters alpha=1.2, sigma=1, and mu=1. The initial values
# are alpha_0=1.2, sigma_0=1, and mu_0=1.
library("stabledist")
y<-urstab(50,1.2,0,1,1,0)
## No test: 
ufitstab.sym(y,1.2,1,1)
## End(No test)



