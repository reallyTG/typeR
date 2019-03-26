context("ANOVA (diet)")
## Generate tree for testing test
library(ape)


## Simulation, test broken due to R 3.6.0 release changing the sample 
## method, and thus `set.seed(4)` is broken.
  
# n = 80
# set.seed(4)
# phy <- rtree(n)
# trait_1 <- runif(n)
# trait_1_SE_sq <- 0.01*runif(n)
# regimes_tip <- factor(sample(c("A", "B"), n, replace = TRUE))
# 
# ## Ancestral state recon
# ans <- ace(regimes_tip, phy, type ="d")
# regimes_internal <- factor(levels(regimes_tip)[apply(ans$lik.anc, 1, function(e) which.max(e))])
# phy$node.label <- regimes_internal
# 
# regimes <- concat.factor(regimes_tip, regimes_internal)
# lineages <- lapply(1:n, function(e) lineage.constructor(phy, e, regimes)) #; names(lineages) <- phy$tip.label
#
## Plot
#plot(phy); tiplabels(regimes_tip); nodelabels(regimes_internal)



data("neocortex")
data("artiodactyla")

neocortex <- neocortex[match(artiodactyla$tip.label, neocortex$species), ]

m1 <- brown.fit(artiodactyla,
                species = neocortex$species,
                sigma2_y_values = lseq(0.007, 0.07, length.out = 40),
                response = neocortex$neocortex_area_mm2_log_mean,
                mv.response = neocortex$neocortex_se_squared,
                fixed.fact = neocortex$diet,
                hillclimb = FALSE)



reference <- structure(c(0.341755546588429, 0.407864742952078, 0.364723324061735, 
                         0.0162920222717242, 0.0263382449836314, 0.0138800506014244), .Dim = 3:2, .Dimnames = list(
                           c("Br", "Gr", "MF"), c("Estimates", "Std. error")))


test_that("No errors ANOVA (neocortex diet)", {
  expect_equal(reference,
               m1$beta_primary$coefficients,
               tolerance = 9e-04)
})
