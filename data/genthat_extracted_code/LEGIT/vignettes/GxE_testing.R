## ---- out.width = "700px"------------------------------------------------
knitr::include_graphics("https://raw.githubusercontent.com/AlexiaJM/LEGIT/master/images/GxE_testing_strong.png")

## ---- out.width = "700px"------------------------------------------------
knitr::include_graphics("https://raw.githubusercontent.com/AlexiaJM/LEGIT/master/images/GxE_testing_weak.png")

## ------------------------------------------------------------------------
set.seed(777)
library(LEGIT)
ex_dia = example_with_crossover(N=250, c=0, coef_main = c(3,1,2), sigma=1, seed=7)
GxE_test_BIC = GxE_interaction_test(data=ex_dia$data, genes=ex_dia$G, env=ex_dia$E, formula_noGxE = y ~ 1, crossover = c("min","max"), criterion="BIC")
GxE_test_BIC$results

## ------------------------------------------------------------------------
GxE_test_BIC_ = GxE_interaction_test(data=ex_dia$data, genes=ex_dia$G, env=ex_dia$E, formula_noGxE = y ~ 1, crossover = c(0, 10), criterion="BIC")
GxE_test_BIC_$results

## ----fig1, fig.height = 5, fig.width = 5---------------------------------
plot(GxE_test_BIC$fits$vantage_sensitivity_WEAK, xlim=c(0,10), ylim=c(3,13),cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

## ------------------------------------------------------------------------
ex_dia_s = example_with_crossover(N=250, c=0, coef_main = c(3,0,2), sigma=1, seed=7)
GxE_test_BIC = GxE_interaction_test(data=ex_dia_s$data, genes=ex_dia_s$G, env=ex_dia_s$E, formula_noGxE = y ~ 1, crossover = c("min","max"), criterion="BIC")
GxE_test_BIC$results

## ----fig2, fig.height = 5, fig.width = 5---------------------------------
plot(GxE_test_BIC$fits$vantage_sensitivity_STRONG, xlim=c(0,10), ylim=c(3,13),cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

## ------------------------------------------------------------------------
ex_ds = example_with_crossover(N=250, c=5, coef_main = c(3+5,1,2), sigma=1, seed=7)
GxE_test_BIC = GxE_interaction_test(data=ex_ds$data, genes=ex_ds$G, env=ex_ds$E, formula_noGxE = y ~ 1, crossover = c("min","max"), criterion="BIC")
GxE_test_BIC$results

## ----fig3, fig.height = 5, fig.width = 5---------------------------------
plot(GxE_test_BIC$fits$diff_suscept_WEAK, xlim=c(0,10), ylim=c(3,13),cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

## ------------------------------------------------------------------------
ex_ds_s = example_with_crossover(N=250, c=5, coef_main = c(3+5,0,2), sigma=1, seed=7)
GxE_test_BIC = GxE_interaction_test(data=ex_ds_s$data, genes=ex_ds_s$G, env=ex_ds_s$E, formula_noGxE = y ~ 1, crossover = c("min","max"), criterion="BIC")
GxE_test_BIC$results

## ----fig4, fig.height = 5, fig.width = 5---------------------------------
plot(GxE_test_BIC$fits$diff_suscept_STRONG, xlim=c(0,10), ylim=c(3,13),cex.leg=1.4, cex.axis=1.5, cex.lab=1.5)

