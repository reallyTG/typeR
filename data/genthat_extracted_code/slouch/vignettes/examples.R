## ----setup, cache=FALSE, include=FALSE-----------------------------------
library(knitr)
knitr::opts_knit$set(global.par = TRUE)
#output <- opts_knit$get("rmarkdown.pandoc.to")
#if (output=="html") opts_chunk$set(fig.width=11, fig.height=11)
#if (output=="docx") opts_chunk$set(fig.width=6,  fig.height=6)

opts_chunk$set(collapse = TRUE, results = 'markup')
par(mar = rep(0,4))

## ----eval = FALSE--------------------------------------------------------
#  install.packages("slouch")

## ---- warning=FALSE, echo = TRUE, message = FALSE, highlight = TRUE, fig.width = 7, fig.height = 5----
# Load necessary packages
library(ape)
library(slouch)

## Load the phylogenetic tree with annotation data
data(artiodactyla)
phy <- artiodactyla

## Load the neocortex dataset
data(neocortex)

## Plot the tree
plot(ladderize(phy), cex = 0.6)

## ----include = FALSE-----------------------------------------------------
par(mar = c(5.1, 4.1, 4.1, 2.1))

## ---- fig.width=7, fig.height = 4, highlight = TRUE----------------------
## Check whether they are lined up correctly
neocortex$species == phy$tip.label

## ---- highlight = TRUE---------------------------------------------------
neocortex <- neocortex[match(phy$tip.label, neocortex$species), ]

## Check if they line up again
neocortex$species == phy$tip.label

## ---- fig.show='hold', highlight = TRUE, fig.width=7, fig.height = 4, fig.cap = "Scatter plot of mean log neocortex area (mm$^2$) on mean log brain mass (g).", fig.pos = "H", out.extra = ""----
braincentered <- neocortex$brain_mass_g_log_mean - mean(neocortex$brain_mass_g_log_mean)
plot(x = braincentered, 
     y = neocortex$neocortex_area_mm2_log_mean, 
     xlab = "Mean log brain mass (g)",
     ylab = "Mean log neocortex area (mm2)")

## ---- highlight = TRUE, fig.width=7, fig.height = 4, fig.cap="The path-trajectory of the L-BFGS-B hillclimber algorithm.", fig.pos = "H"----
model0 <- slouch.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean)

## ---- hightlight = TRUE--------------------------------------------------
print(model0)

## ---- hightlight = TRUE--------------------------------------------------
summary(model0)

## ---- highlight=TRUE, fig.pos = "H"--------------------------------------
model3 <- slouch.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     random.cov = braincentered)
model3

## ---- highlight=TRUE, fig.pos = "H"--------------------------------------
model3 <- slouch.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     mv.response = neocortex$neocortex_se_squared,
                     random.cov = braincentered,
                     mv.random.cov = neocortex$brain_se_squared)

## ---- fig.show='asis', highlight = TRUE, fig.width=7, fig.height = 4, fig.cap = "The evolutionary (black) and optimal (orange) regression lines for the model of mean log neocortex area (mm$^2$) on mean log brain mass (g), both corrected for bias due to measurement error in mean log brain mass.", fig.pos = "H", out.extra=""----
plot(x = braincentered, 
     y = neocortex$neocortex_area_mm2_log_mean, 
     xlab = "Mean log brain mass (g)",
     ylab = "Mean log neocortex area (mm2)")
abline(model3$beta_evolutionary$coefficients_bias_corr[,1], 
       col = "black", lwd = 2)
abline(model3$beta_primary$coefficients_bias_corr[,1], 
       col = "orange", lwd = 2)

## ---- highlight = TRUE, fig.width=7, fig.height = 4, fig.pos = "H", out.extra=""----
bodycentered <- neocortex$body_mass_g_log_mean - mean(neocortex$body_mass_g_log_mean)
model4 <- 
  slouch.fit(phy = phy,
             species = neocortex$species,
             response = neocortex$neocortex_area_mm2_log_mean,
             mv.response = neocortex$neocortex_se_squared,
             random.cov = cbind(braincentered, 
                                bodycentered),
             mv.random.cov = cbind(neocortex$brain_se_squared,
                                   neocortex$body_se_squared))
model4

## ---- highlight = TRUE, fig.width=7, fig.height = 4, eval=F, fig.pos = "H", out.extra=""----
#  model5 <- slouch.fit(phy = phy,
#                       species = neocortex$species,
#                       response = neocortex$neocortex_area_mm2_log_mean,
#                       mv.response = neocortex$neocortex_se_squared,
#                       random.cov = braincentered,
#                       mv.random.cov = neocortex$brain_se_squared,
#                       estimate.Ya = TRUE,
#                       estimate.bXa = TRUE)

## ----include = FALSE, fig.pos = "H"--------------------------------------
par(mar = rep(0, 4))

## ---- fig.width=7, fig.height = 4, highlight = TRUE----------------------
## Inspect the internal node regimes
## These have order n+1, n+2, n+3 ...
internal_regimes <- factor(phy$node.label)

## Concatenate tip and internal regimes. These will have order 1,2,3 ...
regimes <- c(neocortex$diet, internal_regimes)

## Pick out the regimes of the edges, in the order of phy$edge
edge_regimes <- factor(regimes[phy$edge[,2]])

plot(phy, 
     edge.color = c("Black", "Orange", "blue")[edge_regimes], 
     edge.width = 3, cex = 0.6)

## ----include = FALSE-----------------------------------------------------
par(mar = c(5.1, 4.1, 4.1, 2.1))

## ---- highlight = TRUE, fig.pos = "H"------------------------------------
model6 <- slouch.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     direct.cov = neocortex$brain_mass_g_log_mean,
                     fixed.fact = neocortex$diet)

model6

## ---- fig.width = 7, fig.height = 4, highlight = TRUE, fig.pos = "H", out.extra=""----
model7 <- slouch.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     mv.response = neocortex$neocortex_se_squared,
                     direct.cov = neocortex$brain_mass_g_log_mean,
                     mv.direct.cov = neocortex$brain_se_squared)

model7

## ---- fig.width = 7, fig.height = 4, highlight = TRUE, fig.pos = "H"-----
model8 <- brown.fit(phy = phy,
                    species = neocortex$species,
                    response = neocortex$neocortex_area_mm2_log_mean,
                    mv.response = neocortex$neocortex_se_squared)

model8

## ---- fig.width = 7, fig.height = 4, highlight = TRUE, fig.pos = "H"-----
model9 <- brown.fit(phy = phy,
                    species = neocortex$species,
                    response = neocortex$neocortex_area_mm2_log_mean,
                    mv.response = neocortex$neocortex_se_squared,
                    fixed.fact = neocortex$diet)

model9

## ------------------------------------------------------------------------
model9$beta_primary$trend_diff

## ---- fig.width = 7, fig.height = 4, highlight = TRUE, fig.pos = "H"-----
model10 <- brown.fit(phy = phy,
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     mv.response = neocortex$neocortex_se_squared,
                     random.cov = braincentered,
                     mv.random.cov = neocortex$brain_se_squared)

model10

## ------------------------------------------------------------------------
model10$beta_evolutionary$coefficients

## ------------------------------------------------------------------------
## The manual way
h <- c(0.01, 0.1, 1, 5, 10, 15, 20, 100)
vy <- h

## Using the seq function
h <- seq(from = 0.001, to = 100, length.out = 15)
vy <- seq(from = 0.001, to = 5, length.out = 15)

## Using a seq function with logarithmically spaced steps
h <- lseq(from = 0.001, to = 100, length.out = 15)
vy <- lseq(from = 0.001, to = 5, length.out = 15)

## ---- fig.show='asis', fig.width=6, fig.height = 4, fig.cap = "Three-dimensional joint support region for the estimates of half-lives and stationary variances, for the single-optimum model.", highlight = TRUE, warning=FALSE, fig.pos = "H", out.extra=""----
model_grid_0 <- slouch.fit(phy = phy,
                     hl_values = seq(0.001, 12, length.out = 20),
                     vy_values = seq(0.1, 1, length.out = 20),
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     hillclimb = FALSE)
plot(model_grid_0)

## ---- fig.show='asis', fig.width=6, fig.height = 4, fig.cap = "Another slice of the log likelihood surface for the same single-optimum model", highlight = TRUE, warning=FALSE, fig.pos = "H", out.extra=""----
model_grid_1 <- slouch.fit(phy = phy,
                     hl_values = seq(0.001, 150, length.out = 20),
                     vy_values = seq(0.1, 2.5, length.out = 20),
                     species = neocortex$species,
                     response = neocortex$neocortex_area_mm2_log_mean,
                     hillclimb = FALSE)

plot(model_grid_1)

## ---- highlight = TRUE, eval = FALSE, fig.width=7, fig.height = 4, fig.pos = "H", out.extra=""----
#  library(plotly)
#  p <- plot_ly(x = model0$supportplot$hl,
#               y = model0$supportplot$vy,
#               z = model0$supportplot$z) %>%
#    add_surface() %>%
#    layout(title = "Grid-search",
#           scene = list(xaxis = list(title = "Phylogenetic half-life"),
#                        yaxis = list(title = "Stationary variance"),
#                        zaxis = list(title = "Log-likelihood")))
#  
#  p

