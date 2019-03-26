## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(cache = FALSE, autodep = TRUE, collapse = TRUE, comment = "", highlight = FALSE
                      # , fig.height = 3, fig.width = 3, 
                      )

## ------------------------------------------------------------------------
library(bnclassify)
data(car)

## ------------------------------------------------------------------------
nb <- nb('class', car) 
nb <- lp(nb, car, smooth = 0.01) 

## ------------------------------------------------------------------------
narcs(nb)

## ------------------------------------------------------------------------
cv(nb, car, k = 10) 

## ------------------------------------------------------------------------
p <- predict(nb, car)
head(p) 

## ---- echo = FALSE, results='hide', include=FALSE------------------------
set.seed(1)

## ----learn_ode-----------------------------------------------------------
ode_cl_aic <- tan_cl('class', car, score = 'aic')  
set.seed(3)
fssj <- fssj('class', car, k = 5, epsilon = 0)

## ------------------------------------------------------------------------
ode_cl_aic <- bnc('tan_cl', 'class', car, smooth = 1, dag_args = list(score = 'aic'))

## ------------------------------------------------------------------------
ode_cl_aic

## ------------------------------------------------------------------------
ms <- modelstring(ode_cl_aic)
strwrap(ms, width = 60)

## ------------------------------------------------------------------------
is_ode(ode_cl_aic)
params(nb)$buying
length(features(fssj))

## ------------------------------------------------------------------------
manb <- lp(nb, car, smooth = 0.01, manb_prior = 0.5)
manb_arc_posterior(manb)

## ------------------------------------------------------------------------
params(manb)$doors 
all.equal(params(manb)$buying, params(nb)$buying)

## ------------------------------------------------------------------------
logLik(ode_cl_aic, car)
AIC(ode_cl_aic, car)

## ------------------------------------------------------------------------
set.seed(0)
cv(list(nb = nb, ode_cl_aic = ode_cl_aic), car, k = 5, dag = TRUE)

## ------------------------------------------------------------------------
pp <- predict(nb, car, prob = TRUE)
head(pp)

