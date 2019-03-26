## ---- error=TRUE, message=FALSE------------------------------------------
library(etl)
foo <- etl("foo")

## ------------------------------------------------------------------------
ggplots <- etl("ggplot2") %>%
  etl_update()
src_tbls(ggplots)

## ---- error=TRUE---------------------------------------------------------
if (require(macleish)) {
  macleish:::etl_extract.etl_macleish %>% args()
  macleish:::etl_transform.etl_macleish %>% args()
  macleish:::etl_load.etl_macleish %>% args()
}

## ------------------------------------------------------------------------
if (require(macleish)) {
  macleish <- etl("macleish")
  str(macleish)
}

## ------------------------------------------------------------------------
citation("etl")
citation("dplyr")
citation("dbplyr")

