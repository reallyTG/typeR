## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=8, 
  fig.height=5, 
  fig.path="figs-introduction/"
)

## ---- eval=FALSE---------------------------------------------------------
#  vignette("Overview", package = "outbreaker2")

## ---- data---------------------------------------------------------------
library(ape)
library(outbreaker2)

col <- "#6666cc"
fake_outbreak

## ---- w------------------------------------------------------------------

plot(fake_outbreak$w, type = "h", xlim = c(0, 5), 
     lwd = 30, col = col, lend = 2, 
     xlab = "Days after infection", 
     ylab = "p(new case)", 
     main = "Generation time distribution")


## ------------------------------------------------------------------------
args(outbreaker)

## ---- first_run, cache = TRUE--------------------------------------------

dna <- fake_outbreak$dna
dates <- fake_outbreak$sample
w <- fake_outbreak$w
data <- outbreaker_data(dna = dna, dates = dates, w_dens = w)

## we set the seed to ensure results won't change
set.seed(1)


res <- outbreaker(data = data)


## ------------------------------------------------------------------------

class(res)
dim(res)
res


## ------------------------------------------------------------------------

names(res)


## ---- basic_trace--------------------------------------------------------

plot(res)


## ---- traces-------------------------------------------------------------

plot(res, "prior")
plot(res, "mu")
plot(res, "t_inf_15")


## ---- basic_trace_burn---------------------------------------------------

## compare this to plot(res)
plot(res, burnin = 2000)


## ---- many_plots---------------------------------------------------------

plot(res, "mu", "hist", burnin = 2000)

plot(res, "mu", "density", burnin = 2000)

plot(res, type = "alpha", burnin = 2000)

plot(res, type = "t_inf", burnin = 2000)

plot(res, type = "kappa", burnin = 2000)

plot(res, type = "network", burnin = 2000, min_support = 0.01)


## ---- summary------------------------------------------------------------

summary(res)


## ---- config2, cache = TRUE----------------------------------------------

config2 <- create_config(n_iter = 2e4,
                         sample_every = 20,
		         init_tree ="star",
			 move_kappa = FALSE,
			 prior_mu = 10)

set.seed(1)

res2 <- outbreaker(data, config2)
plot(res2)
plot(res2, burnin = 2000)


## ---- res2---------------------------------------------------------------

summary(res2, burnin = 4000)
tree2 <- summary(res2, burnin = 4000)$tree

comparison <- data.frame(case = 1:30,
                       	 inferred = paste(tree2$from),
			 true = paste(fake_outbreak$ances),
			 stringsAsFactors = FALSE)
			 
comparison$correct <- comparison$inferred == comparison$true
comparison
mean(comparison$correct)


## ---- net2---------------------------------------------------------------

plot(res2, type = "network", burnin = 4000, min_support = 0.01)


