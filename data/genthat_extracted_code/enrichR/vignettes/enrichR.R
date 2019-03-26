## ---- echo = TRUE, eval = FALSE------------------------------------------
#  library(devtools)
#  install_github("wjawaid/enrichR")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  install.packages("enrichR")

## ---- echo = TRUE, eval = TRUE-------------------------------------------
library(enrichR)
dbs <- listEnrichrDbs()

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  head(dbs)

## ---- echo = FALSE, results='asis'---------------------------------------
library(knitr)
kable(head(dbs[c(1:3,5:6),]))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
dbs <- c("GO_Molecular_Function_2015", "GO_Cellular_Component_2015", "GO_Biological_Process_2015")
enriched <- enrichr(c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr"), dbs)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  enriched[["GO_Biological_Process_2015"]]

## ---- echo = FALSE, results = 'asis'-------------------------------------
x <- head(enriched[["GO_Biological_Process_2015"]])
x[,1] <- gsub("GO:", "GO_", x[,1])
kable(x)

