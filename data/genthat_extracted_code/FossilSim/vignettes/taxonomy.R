## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5, fig.height = 5
)

## ---- echo = FALSE, results = "hide", message = FALSE--------------------
library(FossilSim)

## ----echo=FALSE, out.width = "80%", fig.cap = cap------------------------
knitr::include_graphics("speciation_types.jpg")
cap = "**Fig. 1**. Three different modes of speciation that can be simulated using FossilSim. Budding and bifurcation are also referred to as asymmetric and symmetric speciation."

## ------------------------------------------------------------------------
# set the random number generator seed to generate the same results using the same code
set.seed(123)

# simulate a tree using TreeSim conditioned on tip number
lambda = 1
mu = 0.2
tips = 8
t = TreeSim::sim.bd.taxa(n = tips, numbsim = 1, lambda = lambda, mu = mu)[[1]]
# t is an object of class phylo
t
# use t$edge, t$edge.length, t$root.edge to see the tree attributes

# simulate under complete budding speciation 
s = sim.taxonomy(tree = t) # this is equivalent to using the default parameters beta = 0, lambda_a = 0, kappa = 0
# s is an object of class taxonomy
s

## ------------------------------------------------------------------------
plot(s, tree = t, legend.position = "topleft")

## ------------------------------------------------------------------------
# simulate under complete bifurcating speciation
s = sim.taxonomy(tree = t, beta = 1)
plot(s, tree = t, legend.position = "topleft")

## ------------------------------------------------------------------------
# simulate under mixed speciation
s = sim.taxonomy(tree = t, beta = 0.5, lambda.a = 1, kappa = 0.1)
plot(s, tree = t, legend.position = "topleft")

## ------------------------------------------------------------------------
# simulate taxonomy without anagenetic or cryptic species
s1 = sim.taxonomy(tree = t, beta = 0.5)

# simulate anagenetic species 
# note this function also requires the corresponding tree object
s2 = sim.anagenetic.species(tree = t, species = s1, lambda.a = 1)

# simulate cryptic species
s3 = sim.cryptic.species(species = s2, kappa = 0.1)

