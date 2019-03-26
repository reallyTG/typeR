library(GGUM)


### Name: plotCRC
### Title: Plot item category response curves (CRCs)
### Aliases: plotCRC

### ** Examples

# For GUM:
# Generate data:
gen1 <- GenData.GGUM(400, 5, 3, "GUM", seed = 139)
# Fit the GUM:
fit1 <- GUM(gen1$data, 3)
# Plot CRCs:
plotCRC(fit1, items = 1, quiet = TRUE)
## Not run: 
##D # For GGUM:
##D # Generate data:
##D set.seed(1); C <- sample(3:5, 10, replace = TRUE)
##D gen2 <- GenData.GGUM(2000, 10, C, "GGUM", seed = 156)
##D # Fit the GGUM:
##D fit2 <- GGUM(gen2$data, C)
##D # Plot CRCs:
##D plotCRC(fit2, items = 1, quiet = TRUE)
## End(Not run)




