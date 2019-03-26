library(GMCM)


### Name: inv.logit
### Title: Logit and inverse logit transforms
### Aliases: inv.logit logit
### Keywords: internal

### ** Examples

p <- runif(100)
print(a <- GMCM:::logit(p))
p - GMCM:::inv.logit(a)



