library(SHELF)


### Name: fitDirichlet
### Title: Fit a Dirichlet distribution to elicited marginal distributions
###   for proportions
### Aliases: fitDirichlet

### ** Examples

## Not run: 
##D p1 <- c(0.25, 0.5, 0.75)
##D v1 <- c(0.5, 0.55, 0.6)
##D v2 <- c(0.22, 0.3, 0.35)
##D v3 <- c(0.11, 0.15, 0.2)
##D myfit1 <- fitdist(v1, p1, 0, 1)
##D myfit2 <- fitdist(v2, p1, 0, 1)
##D myfit3 <- fitdist(v3, p1, 0, 1)
##D d <- fitDirichlet(myfit1, myfit2, myfit3,
##D                   categories = c("A","B","C"),
##D                   n.fitted = "opt")
## End(Not run)



