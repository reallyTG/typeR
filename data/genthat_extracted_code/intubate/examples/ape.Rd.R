library(intubate)


### Name: ape
### Title: Interfaces for ape package for data science pipelines.
### Aliases: ntbt_binaryPGLMM ntbt_compar.gee ntbt_correlogram.formula
###   ntbt_lmorigin ntbt_yule.cov
### Keywords: intubate magrittr ape binaryPGLMM compar.gee
###   correlogram.formula lmorigin yule.cov

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(ape)
##D 
##D ## ntbt_binaryPGLMM: Phylogenetic Generalized Linear Mixed Model for Binary Data
##D n <- 100
##D phy <- compute.brlen(rtree(n=n), method = "Grafen", power = 1)
##D X1 <- rTraitCont(phy, model = "BM", sigma = 1)
##D X1 <- (X1 - mean(X1))/var(X1)
##D sim.dat <- data.frame(Y=array(0, dim=n), X1=X1, row.names=phy$tip.label)
##D sim.dat$Y <- binaryPGLMM.sim(Y ~ X1, phy = phy, data = sim.dat, s2 = .5,
##D                              B = matrix(c(0, .25), nrow = 2, ncol = 1), nrep = 1)$Y
##D 
##D ## Original function to interface
##D binaryPGLMM(Y ~ X1, phy = phy, data = sim.dat)
##D 
##D ## The interface puts data as first parameter
##D ntbt_binaryPGLMM(sim.dat, Y ~ X1, phy = phy)
##D 
##D ## so it can be used easily in a pipeline.
##D sim.dat %>%
##D   ntbt_binaryPGLMM(Y ~ X1, phy = phy)
##D 
##D 
##D ## ntbt_compar.gee: Comparative Analysis with GEEs
##D tr <- "((((Homo:0.21,Pongo:0.21):0.28,Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);"
##D tree.primates <- read.tree(text = tr)
##D dta <- data.frame(X = c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968),
##D                   Y = c(4.74493, 3.33220, 3.36730, 2.89037, 2.30259))
##D rownames(dta) <- tree.primates$tip.label
##D 
##D ## Original function to interface
##D compar.gee(X ~ Y, phy = tree.primates, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_compar.gee(dta, X ~ Y, phy = tree.primates)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_compar.gee(X ~ Y, phy = tree.primates)
##D 
##D 
##D ## ntbt_correlogram.formula: Phylogenetic Correlogram
##D data(carnivora)
##D 
##D ## Original function to interface
##D correlogram.formula(SW ~ Order/SuperFamily/Family/Genus,
##D                     data = carnivora)
##D 
##D ## The interface puts data as first parameter
##D ntbt_correlogram.formula(carnivora, SW ~ Order/SuperFamily/Family/Genus)
##D 
##D ## so it can be used easily in a pipeline.
##D carnivora %>%
##D   ntbt_correlogram.formula(SW ~ Order/SuperFamily/Family/Genus)
##D 
##D 
##D ## ntbt_lmorigin: Multiple regression through the origin
##D data(lmorigin.ex1)
##D 
##D ## Original function to interface
##D lmorigin(SO2 ~ ., data = lmorigin.ex1, origin = FALSE, nperm = 99)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lmorigin(lmorigin.ex1, SO2 ~ ., origin = FALSE, nperm = 99)
##D 
##D ## so it can be used easily in a pipeline.
##D lmorigin.ex1 %>%
##D   ntbt_lmorigin(SO2 ~ ., origin = FALSE, nperm = 99)
##D 
##D ## ntbt_yule.cov: Fits the Yule Model With Covariates
##D data(bird.orders)
##D dta <- data.frame (x = rnorm(45))
##D 
##D ## Original function to interface
##D yule.cov(bird.orders, ~ x, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_yule.cov(dta, bird.orders, ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_yule.cov(bird.orders, ~ x)
## End(Not run)



