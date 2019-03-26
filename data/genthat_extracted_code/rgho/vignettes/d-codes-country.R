## ---- echo=FALSE, include=FALSE------------------------------------------
library(rgho)
library(knitr)

## ---- echo=FALSE---------------------------------------------------------
kable(
  dplyr::arrange(
    rgho:::to_data_frame(
      get_gho_codes(dimension = "COUNTRY")
      ),
    Label)
  )

