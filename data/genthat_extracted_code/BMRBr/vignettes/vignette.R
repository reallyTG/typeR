## ---- results='asis'-----------------------------------------------------
library(BMRBr)

## ----eval=FALSE----------------------------------------------------------
#  bmrb_download(965, "/Users/download")

## ----eval=FALSE----------------------------------------------------------
#  bmrb_download(c(965, 966, 967), "/Users/download")

## ----eval=FALSE----------------------------------------------------------
#  bmrb_list = collect_ids(to_list = TRUE)
#  bmrb_list[c(1:10),]

## ----eval=FALSE----------------------------------------------------------
#  bmrb_table = collect_ids(to_list = FALSE)
#  bmrb_table[c(1:10),]

