library(GGUM)


### Name: plotICC
### Title: Plot item characteristic curves (ICCs)
### Aliases: plotICC

### ** Examples

# For GUM:
# Generate data
#   (toy example: Too few items (due to computation time constraints) for 
#   accurate estimation of person parameters; larger number of items is 
#   required in practice):
gen1 <- GenData.GGUM(400, 5, 3, "GUM", seed = 139)
# Fit the GUM:
fit1 <- GUM(gen1$data, 3)
th1  <- Theta.EAP(fit1)
# Plot ICCs:
plotICC(fit1, th1, items = 1, quiet = TRUE)
## Not run: 
##D # For GGUM:
##D # Generate data:
##D set.seed(1); C <- sample(3:5, 10, replace = TRUE)
##D gen2 <- GenData.GGUM(2000, 10, C, "GGUM", seed = 156)
##D # Fit the GGUM:
##D fit2 <- GGUM(gen2$data, C)
##D th2  <- Theta.EAP(fit2)
##D # Plot ICCs:
##D plotICC(fit2, th2, items = 1, quiet = TRUE)
## End(Not run)




