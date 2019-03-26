## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(ape)
library(PCMBase)

## ------------------------------------------------------------------------
modelBM <- PCM(model = "BM", k = 2)

## ------------------------------------------------------------------------
modelBM

## ------------------------------------------------------------------------
modelBM.ab <- PCM("BM", k = 2, regimes = c("a", "b"))
modelBM.ab

## ------------------------------------------------------------------------
modelBM.ab$X0[] <- c(5, 2)

## ------------------------------------------------------------------------
PCMParamCount(modelBM)
PCMParamCount(modelBM.ab)

## ------------------------------------------------------------------------
# in regime 'a' the traits evolve according to two independent BM processes (starting from the global vecto X0).
modelBM.ab$Sigma_x[,, "a"] <- rbind(c(1.6, 0),
                                  c(0, 2.4))
modelBM.ab$Sigmae_x[,, "a"] <- rbind(c(.1, 0),
                                   c(0, .4))
# in regime 'b' there is a correlation between the traits
modelBM.ab$Sigma_x[,, "b"] <- rbind(c(1.6, .8),
                                  c(.8, 2.4))
modelBM.ab$Sigmae_x[,, "b"] <- rbind(c(.1, 0),
                                   c(0, .4))

## ------------------------------------------------------------------------
param <- double(PCMParamCount(modelBM.ab))

# load the current model parameters into param
PCMParamLoadOrStore(modelBM.ab, param, offset=0, load=FALSE)

print(param)

# modify slightly the model parameters
param2 <- jitter(param)

print(param2)

# set the new parameter vector
PCMParamLoadOrStore(modelBM.ab, param2, offset = 0, load=TRUE)

print(modelBM.ab)

## ------------------------------------------------------------------------
# make results reproducible
set.seed(2)

# number of regimes
R <- 2

# number of extant tips
N <- 100

tree.a <- rtree(n=N)
PCMTreeSetLabels(tree.a)
PCMTreeSetDefaultRegime(tree.a, regime = "a")

lstDesc <- PCMTreeListDescendants(tree.a)
splitNode <- names(lstDesc)[which(sapply(lstDesc, length) > N/2 & sapply(lstDesc, length) < 2*N/3)][1]

tree.ab <- PCMTreeInsertSingletons(tree.a, nodes = as.integer(splitNode), 
                                   positions = PCMTreeGetBranchLength(tree.a, as.integer(splitNode))/2)
PCMTreeSetRegimes(tree.ab, nodes = splitNode, regimes = c("a", "b"), inplace = TRUE)

# Currently this is causing a failure of the pkgdown::build_site(), so we use the 
# ape's tree-plotting function
# PCMTreePlot(tree.ab)

palette <- PCMColorPalette(2, c("a", "b"))
plot(tree.ab, show.tip.label=FALSE, edge.color = palette[tree.ab$edge.regime])

## ------------------------------------------------------------------------
traits <- PCMSim(tree.ab, modelBM.ab, modelBM.ab$X0)

## ------------------------------------------------------------------------
PCMLik(traits, tree.ab, modelBM.ab)

## ------------------------------------------------------------------------
# a function of a numerical parameter vector:
likFun <- PCMCreateLikelihood(traits, tree.ab, modelBM.ab)

likFun(param2)

