library(plotSEMM)


### Name: plotSEMM_probability
### Title: Probability plot
### Aliases: plotSEMM_probability
### Keywords: color hplot

### ** Examples

## Not run: 
##D # 2 class empirical example on positive emotions and heuristic processing in
##D # Pek, Sterba, Kok & Bauer (2009)
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
##D plotSEMM_probability(plotobj)
##D 
##D plotSEMM_probability(plotobj , EtaName = "Latent Predictor", lnty = 2, title = "Probability")
## End(Not run)



