## ----poppr_citation------------------------------------------------------
citation(package = "poppr")

## ----load_cats-----------------------------------------------------------
library("popprxl")
(nancyxlsx <- system.file("files/nancycats.xlsx", package = "popprxl"))
(nancy    <- read.genalexcel(nancyxlsx))

## ----missing_cats, fig.width = 8, fig.height = 5-------------------------
info_table(nancy, plot = TRUE)

