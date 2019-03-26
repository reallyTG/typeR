library(GGUM)


### Name: MODFIT
### Title: MODFIT for the GGUM
### Aliases: MODFIT

### ** Examples

# For GUM:
# Generate data:
gen1 <- GenData.GGUM(400, 5, 3, "GUM", seed = 139)
# Fit the GUM:
fit1 <- GUM(gen1$data, 3)
# Compute the adjusted chi square degrees of freedom ratios:
modfit.res1 <- MODFIT(fit1)
modfit.res1$Singlets
modfit.res1$Doublets
modfit.res1$Triplets
modfit.res1$Summary
## Not run: 
##D # For GGUM:
##D # Generate data:
##D set.seed(1); C <- sample(3:5, 10, replace = TRUE)
##D gen2 <- GenData.GGUM(2000, 10, C, "GGUM", seed = 156)
##D # Fit the GGUM:
##D fit2 <- GGUM(gen2$data, C)
##D # Compute the adjusted chi square degrees of freedom ratios:
##D modfit.res2 <- MODFIT(fit1)
##D modfit.res2$Singlets
##D modfit.res2$Doublets
##D modfit.res2$Triplets
##D modfit.res2$Summary
## End(Not run)




