library(plotSEMM)


### Name: plotSEMM_contour
### Title: Nonlinear regression function
### Aliases: plotSEMM_contour
### Keywords: color hplot

### ** Examples

## Not run: 
##D ## code for latent variables with two classes
##D pi <- c(0.602, 0.398)
##D 
##D alpha1 <- c(3.529, 2.317)
##D 
##D alpha2 <- c(0.02, 0.336)
##D 
##D beta21 <- c(0.152, 0.053)
##D 
##D psi11 <- c(0.265, 0.265)
##D 
##D psi22 <- c(0.023, 0.023)
##D 
##D 
##D plotobj <- plotSEMM_setup(pi, alpha1, alpha2, beta21, psi11, psi22)
##D 
##D 
##D plotSEMM_contour(plotobj)
##D 
##D plotSEMM_contour(plotobj, EtaN1 = "Latent Predictor", 
##D    EtaN2 = "Latent Outcome", classinfo = FALSE, lncol = 5) 
## End(Not run)



