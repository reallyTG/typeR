## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4
)

## ------------------------------------------------------------------------
library(ypr)
population <- ypr_population(Linf = 100, k = 0.2, t0 = 0)
ypr_plot_schedule(population, "Age", "Length")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, Wa = 0.01, Wb = 3)
ypr_plot_schedule(population, "Length", "Weight")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, fa = 1, fb = 1)
ypr_plot_schedule(population, "Weight", "Fecundity")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, Ls = 50, Sp = 10, es = 0.8)
ypr_plot_schedule(population, "Length", "Spawning")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, M = 0.2, Mb = -0.5)
ypr_plot_schedule(population, "Length", "NaturalMortality")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, Sm = 0.5)
ypr_plot_schedule(population, "Length", "NaturalMortality")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, Lv = 50, Vp = 50)
ypr_plot_schedule(population, "Length", "Vulnerability")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, rho = 0.5, Llo = 40, Lup = 70, Nc = 0.1)
ypr_plot_schedule(population, "Length", "Retention")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, pi = 0.3, Hm = 0.2)
ypr_plot_schedule(population, "Length", "FishingMortality")

## ------------------------------------------------------------------------
population <- ypr_population_update(population, Rk = 3)
ypr_plot_sr(population, plot_values = FALSE)

## ------------------------------------------------------------------------
population <- ypr_population_update(population, BH = 0L)
ypr_plot_sr(population, plot_values = FALSE)

## ------------------------------------------------------------------------
ypr_plot_schedule(population, "Age", "Survivorship")

## ------------------------------------------------------------------------
ypr_plot_yield(population, harvest = TRUE, biomass = TRUE, Ly = 60)
ypr_tabulate_yield(population, harvest = TRUE, biomass = TRUE, Ly = 60)

## ------------------------------------------------------------------------
ypr_plot_yield(population, y = "Effort", harvest = TRUE, biomass = TRUE, Ly = 60)

## ------------------------------------------------------------------------
ypr_plot_yield(population, y = "YPUE", harvest = TRUE, biomass = TRUE, Ly = 60)

