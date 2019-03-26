library(GMCM)


### Name: GMCM-package
### Title: Fast optimization of Gaussian Mixture Copula Models
### Aliases: GMCM-package GMCM

### ** Examples

# Loading data
data(u133VsExon)

# Subsetting data to reduce computation time
u133VsExon <- u133VsExon[1:5000, ]

# Ranking and scaling,
# Remember large values should be critical to the null!
uhat <- Uhat(1 - u133VsExon)

# Visualizing P-values and the ranked and scaled P-values
## Not run: 
##D par(mfrow = c(1,2))
##D plot(u133VsExon, cex = 0.5, pch = 4, col = "tomato", main = "P-values",
##D      xlab = "P   (U133)", ylab = "P   (Exon)")
##D plot(uhat, cex = 0.5, pch = 4, col = "tomato", main = "Ranked P-values",
##D      xlab = "rank(1-P)   (U133)", ylab = "rank(1-P)   (Exon)")
## End(Not run)

# Fitting using BFGS
fit <- fit.meta.GMCM(uhat, init.par = c(0.5, 1, 1, 0.5), pgtol = 1e-2,
                     method = "L-BFGS", positive.rho = TRUE, verbose = TRUE)

# Compute IDR values and classify
idr <- get.IDR(uhat, par = fit)
table(idr$K) # 1 = irreproducible, 2 = reproducible

## Not run: 
##D # See clustering results
##D par(mfrow = c(1,2))
##D plot(u133VsExon, cex = 0.5, pch = 4, main = "Classified genes",
##D      col = c("tomato", "steelblue")[idr$K],
##D      xlab = "P-value (U133)", ylab = "P-value (Exon)")
##D plot(uhat, cex = 0.5, pch = 4, main = "Classified genes",
##D      col = c("tomato", "steelblue")[idr$K],
##D      xlab = "rank(1-P) (U133)", ylab = "rank(1-P) (Exon)")
## End(Not run)



