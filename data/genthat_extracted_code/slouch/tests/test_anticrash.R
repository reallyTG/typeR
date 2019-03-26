context("Crash test")
## Generate tree for testing test
library(ape)
n = 80
set.seed(4)
phy <- rtree(n)
trait_1 <- runif(n)
trait_1_SE_sq <- 0.01*runif(n)
trait_2 <- runif(n)
trait_2_SE_sq <- 0.01*runif(n)
trait_3 <- runif(n)
trait_3_SE_sq <- 0.01*runif(n)
trait_4 <- runif(n)
trait_4_SE_sq <- 0.01*runif(n)

regimes_tip <- factor(sample(c("A", "B"), n, replace = TRUE))

## Ancestral state recon
ans <- ace(regimes_tip, phy, type ="d")
regimes_internal <- factor(levels(regimes_tip)[apply(ans$lik.anc, 1, function(e) which.max(e))])
phy$node.label <- regimes_internal
#levels(regimes_internal) <- c(levels(regimes_internal), "root"); regimes_internal[1] <- "root"

## Plot
#plot(phy); tiplabels(regimes_tip); nodelabels(regimes_internal)

regimes <- concat.factor(regimes_tip, regimes_internal)
lineages <- lapply(1:n, function(e) lineage.constructor(phy, e, regimes)) #; names(lineages) <- phy$tip.label


m1 <- slouch.fit(phy,
                     species = phy$tip.label,
                     hl_values = seq(0.001,0.4, length.out = 3),
                     vy_values = seq(0.05,0.15, length.out = 3),
                     response = trait_1,
                     mv.response = trait_1_SE_sq,
                     fixed.fact = regimes_tip)

m2 <- slouch.fit(phy,
                 species = phy$tip.label,
                 hl_values = seq(0.001,0.4, length.out = 3),
                 vy_values = seq(0.05,0.15, length.out = 3),
                 response = trait_1,
                 mv.response = trait_1_SE_sq,
                 direct.cov = cbind(a = rnorm(n)),
                 mv.direct.cov = 0.001*rnorm(n),
                 fixed.fact = regimes_tip)

m3 <- slouch.fit(phy,
                     species = phy$tip.label,
                     hl_values = seq(0.001,0.4, length.out = 3),
                     vy_values = seq(0.05,0.15, length.out = 3),
                     response = trait_1,
                     mv.response = trait_1_SE_sq,
                     random.cov = rnorm(n),
                     mv.random.cov = 0.001*rnorm(n),
                     fixed.fact = regimes_tip)

## The "everything" model
m3 <- slouch.fit(phy,
                     species = phy$tip.label,
                     hl_values = seq(0.1,0.4, length.out = 3),
                     vy_values = seq(0.05,0.15, length.out = 3),
                     response = trait_1,
                     mv.response = trait_1_SE_sq,
                     random.cov = cbind(a = trait_1, b = trait_2),
                     mv.random.cov = cbind(trait_1_SE_sq, trait_2_SE_sq),
                     direct.cov = cbind(c = trait_3, d = trait_4),
                     mv.direct.cov = cbind(trait_3_SE_sq, trait_4_SE_sq),
                     fixed.fact = regimes_tip,
                     estimate.Ya = FALSE,
                     estimate.bXa = FALSE)


## The "everything" model without measurement error
## The "everything" model
m4 <- slouch.fit(phy,
                 species = phy$tip.label,
                 hl_values = seq(0.1,0.4, length.out = 3),
                 vy_values = seq(0.05,0.15, length.out = 3),
                 response = trait_1,
                 mv.response = trait_1_SE_sq,
                 random.cov = cbind(a = rnorm(n), b = rnorm(n)),
                 direct.cov = cbind(c = rnorm(n), d = rnorm(n)),
                 fixed.fact = regimes_tip,
                 estimate.Ya = FALSE,
                 estimate.bXa = FALSE)

#detach(dummydata)

test_that("1 + 1 = 2", {
  expect_equal(1 + 1, 2)
})

