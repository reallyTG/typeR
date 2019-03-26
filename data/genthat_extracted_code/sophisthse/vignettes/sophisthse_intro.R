## ---- eval=FALSE---------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("bdemeshev/sophisthse")

## ---- warning=FALSE, message=FALSE---------------------------------------
library("sophisthse") # для скачивания данных
library("forecast") # графики временных рядов, ARIMA/ETS модели

## ------------------------------------------------------------------------
df <- sophisthse("WAG_Y")
head(df)

## ------------------------------------------------------------------------
info <- sophisthse_metadata(df)
info

## ---- fig.width = 7, fig.height = 6--------------------------------------
WAG_C_Y <- df[, 1]
ggtsdisplay(WAG_C_Y)

## ------------------------------------------------------------------------
wagez <- sophisthse("WAG_Y", output = "zoo")
head(wagez)

## ------------------------------------------------------------------------
wagez <- sophisthse("GDPVA_Y", output = "data.frame")
head(wagez)

## ------------------------------------------------------------------------
wgpd <- sophisthse(c("WAG_Y", "GDPVA_Y"))
head(wgpd)

## ------------------------------------------------------------------------
head(series_info)

## ---- eval=FALSE---------------------------------------------------------
#  View(series_info)

## ------------------------------------------------------------------------
sophisthse_tables()

