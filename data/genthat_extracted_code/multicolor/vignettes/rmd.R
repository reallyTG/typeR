## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(crayon.enabled = TRUE)

## ------------------------------------------------------------------------
library(multicolor)

## ---- results="asis"-----------------------------------------------------
multi_color("Brutus is just as smart as Caesar, people totally like Brutus just as much as they like Caesar, and when did it become okay for one person to be the boss of everybody because that's not what Rome is about! We should totally just STAB CAESAR!",

colors = c(wesanderson::wes_palettes$GrandBudapest2, wesanderson::wes_palettes$GrandBudapest2),

type = "rmd")

## ----message=FALSE-------------------------------------------------------
multi_color(type = "rmd")

## ----eval=FALSE----------------------------------------------------------
#  knitr::opts_chunk$set(results = "asis")

## ---- eval=FALSE---------------------------------------------------------
#  options(crayon.enabled = TRUE)

