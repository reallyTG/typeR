## ---- cache = FALSE, include=FALSE---------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

## ------------------------------------------------------------------------
(d.quantities <- d.units <- d.errors <- read.csv(textConnection("
quantities,        units,  errors
1.02(5) g,         1.02 g, 1.02(5)
2.51(0.01) V,      2.51 V, 2.51(0.01)
(3.23 +/- 0.12) m, 3.23 m, 3.23 +/- 0.12"), stringsAsFactors=FALSE))

## ------------------------------------------------------------------------
library(quantities)

for (name in names(d.quantities)) {
  message(name)
  d.quantities[[name]] <- parse_quantities(d.quantities[[name]])
  d.units[[name]] <- parse_units(d.units[[name]])
  d.errors[[name]] <- parse_errors(d.errors[[name]])
}

d.quantities
d.units
d.errors

