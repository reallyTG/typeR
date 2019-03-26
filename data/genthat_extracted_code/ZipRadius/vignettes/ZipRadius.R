## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ZipRadius)

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('EAVWing/ZipRadius')

## ------------------------------------------------------------------------
test <- zipRadius("30316", 3.5)
test

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('arilamstein/choroplethrZip@v1.3.0')

## ------------------------------------------------------------------------
getStates("30316", 200)

## ------------------------------------------------------------------------
getZips("30316", 3.5)

## ------------------------------------------------------------------------
getZipPop("30316", 3.5)

## ---- eval=FALSE---------------------------------------------------------
#  library(ZipRadius)
#  library(choroplethrZip)
#  library(ggplot2)
#  
#  makeZipMap <- function(zipcode, radius){
#    choro = choroplethrZip::ZipChoropleth$new(getZipPop(zipcode, radius))
#    suppressMessages(suppressWarnings(choro$prepare_map()))
#    choro$legend = "Population"
#    ec_zips = getZips(zipcode, radius)
#    ec_df   = choro$choropleth.df[choro$choropleth.df$region %in% ec_zips,]
#    ec_plot = choro$render_helper(ec_df, "", choro$theme_clean())
#  
#    ec_plot + ggplot2::coord_map()
#  }
#  makeZipMap("30316", 500)

## ----pressure, echo=FALSE, out.width = '100%'----------------------------
knitr::include_graphics("500miFrom30316.png")

