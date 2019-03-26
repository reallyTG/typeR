library(adespatial)


### Name: listw.select
### Title: Function to optimize the selection of a spatial weighting matrix
###   and select the best subset of eigenvectors (MEM, Moran's Eigenvector
###   Maps)
### Aliases: listw.select
### Keywords: spatial

### ** Examples

if(require(spdep)) {
### Create a grid of 15 x 15:
grid <- expand.grid(x = seq(1, 15, 1), y = seq(1, 15, 1))
### Generate a response variable Y structured at broad scale by linear combination of
### the first three MEM variables to which a normal noise is added:
nb <- cell2nb(nrow = 15, ncol = 15, "queen")
lw <- nb2listw(nb, style = "B")
MEM <- scores.listw(lw, MEM.autocor = "positive")
# Degree of spatial autocorrelation:
intensity <- 0.8
Y_space <- scale(MEM[, 1] + MEM[, 2] + MEM[, 3]) * intensity
Y_noise <- scale(rnorm(n = nrow(MEM), mean = 0, sd = 1)) * (1 - intensity)
Y <- Y_space + Y_noise
### Y is sampled in 100 randomly-chosen sites of the grid:
idx.sample <- sample(c(1:nrow(grid)), 100, replace = FALSE)
xy <- grid[idx.sample, ]
Y_sampled <- Y[idx.sample]
### The function listw.candidates is used to build the spatial weighting matrices that
### we want to test and compare (with the listw.select function). We test a Gabriel's graph,
### a minimum spanning tree, and a distance-based connectivity defined by a threshold
### distance corresponding to the smallest distance keeping all sites connected (i.e.,
### the defaut value of d2; see help of function listw.candidates).
### These connectivity matrices are then either not weighted (binary weighting), or
### weighted by the linearly decreasing function (see help of the function listw.candidates):
candidates <- listw.candidates(coord = xy, nb = c("gab", "mst"), weights = c("binary", "flin"))
### Number of candidate W matrices generated:
nbw <- length(candidates)
### Significance threshold value after p-value correction (Sidak correction):
1 - (1 - 0.05)^(1/nbw)
### Optimization of the selection of the SWM among the candidates generated above,
### using the corrected significance threshold calculated above for the global tests:
W_sel <- listw.select(Y_sampled, candidates, MEM.autocor = "positive", method = "FWD",
                    p.adjust = TRUE, nperm = 299)
### Some characteristics of the best spatial model:
# Best SWM:
W_sel$best.id
# Selected subset of spatial predictor within the best SWM:
W_sel$best$MEM.select
nrow(W_sel$best$summary)
# Corrected p-value of the global test of the best SWM:
W_sel$best$global.test$Pvalue
# Adjusted R2 of the subset of spatial predictors selected within the chosen SWM:
max(W_sel$best$summary$R2Adj)
# p-values of all the tested W matrices:
W_sel$candidates$Pvalue
# Adjusted R2 of the subset of spatial predictors selected for all the significant
# W matrices:
W_sel$candidates$R2Adj.select

# See Appendix S3 of Bauman et al. 2018 for more extensive examples and illustrations.
}




