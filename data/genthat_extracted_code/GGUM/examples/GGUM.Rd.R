library(GGUM)


### Name: GGUM
### Title: Fit the generalized graded unfolding model (GGUM)
### Aliases: GGUM

### ** Examples

## Not run: 
##D # Example 1 - Same value C across items:
##D # Generate data:
##D gen1 <- GenData.GGUM(2000, 10, 2, seed = 125)
##D # Fit the GGUM:
##D fit1 <- GGUM(gen1$data, 2)
##D # Compare true and estimated item parameters:
##D cbind(gen1$alpha, fit1$alpha)
##D cbind(gen1$delta, fit1$delta)
##D cbind(c(gen1$taus[, 4:5]), c(fit1$taus[, 4:5]))
##D 
##D # Example 2 - Different C across items:
##D # Generate data:
##D set.seed(1); C <- sample(3:5, 10, replace = TRUE)
##D gen2 <- GenData.GGUM(2000, 10, C, seed = 125)
##D # Fit the GGUM:
##D fit2 <- GGUM(gen2$data, C)
##D # Compare true and estimated item parameters:
##D cbind(gen2$alpha, fit2$alpha)
##D cbind(gen2$delta, fit2$delta)
##D cbind(c(gen2$taus[, 7:11]), c(fit2$taus[, 7:11]))
## End(Not run)



