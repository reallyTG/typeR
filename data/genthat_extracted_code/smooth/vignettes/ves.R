## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=5.5, fig.path='Figs/', fig.show='hold',
                      warning=FALSE, message=FALSE)

## ----load_libraries, message=FALSE, warning=FALSE------------------------
require(smooth)
require(Mcomp)

## ----form_the_vector, message=FALSE, warning=FALSE-----------------------
Y <- cbind(M3$N2570$x,M3$N2571$x);

## ----ves_basic-----------------------------------------------------------
ves(Y, h=18, holdout=TRUE, silent=FALSE)

## ----ves_AAN_persistence_dep---------------------------------------------
ourModel <- ves(Y, "AAN", persistence="d", h=18, holdout=TRUE, silent=FALSE)

## ----ves_AAN_persistence_dep_value---------------------------------------
ourModel$persistence

## ----ves_MMdM------------------------------------------------------------
ourModel <- ves(Y, "MMdM", phi="i", persistence="i", h=18, holdout=TRUE)

