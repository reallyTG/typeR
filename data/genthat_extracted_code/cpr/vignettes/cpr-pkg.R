## ----setup, include = FALSE----------------------------------------------
library(knitr)
opts_chunk$set(collapse = TRUE,
               fig.align = "center")

## ------------------------------------------------------------------------
# Needed packages to run the examples in this vignette
library(cpr)
library(splines)

## ------------------------------------------------------------------------
# Construct the initial control polygon
initial_cp <- cp(log10(pdg) ~ bsplines(day, df = 54), data = spdg)

# Run CPR
cpr_run    <- cpr(initial_cp)

## ------------------------------------------------------------------------
# sequential control polygons
plot(cpr_run, color = TRUE)

## ------------------------------------------------------------------------
# RMSE by model index
plot(cpr_run, type = 'rmse', to = 10)

## ------------------------------------------------------------------------
selected_cp <- cpr_run[[4]]
selected_cp$iknots

## ------------------------------------------------------------------------
selected_cp <- update(selected_cp, keep_fit = TRUE)
selected_fit <- selected_cp$fit
coef_matrix <- summary(selected_fit)$coef
dimnames(coef_matrix)[[1]] <- paste("Vertex", 1:7)
coef_matrix

## ---- eval = FALSE-------------------------------------------------------
#  library(lme4)
#  initial_lmer_cp <- cp(log10(pdg) ~ bsplines(day, df = 54) + (1 | id),
#                        data = spdg,
#                        method = lmer)

## ------------------------------------------------------------------------
bmat <- bsplines(x = seq(0, 6, length = 500), iknots = c(1.0, 1.5, 2.3, 4.0, 4.5))
plot(bmat)

## ------------------------------------------------------------------------
print(sessionInfo(), local = FALSE)

