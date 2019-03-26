## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(theiaR)

## ---- eval=T-------------------------------------------------------------
myquery <- list(collection  = "SENTINEL2",
                town        = "Grenoble",
                start.date  = "2018-07-01",
                end.date    = "2018-07-06")

## ------------------------------------------------------------------------
mycollection <- TheiaCollection$new(query = myquery, dir.path = ".")

## ------------------------------------------------------------------------
print(mycollection)

## ---- eval=T-------------------------------------------------------------
cart.path <- system.file("extdata", "cart.meta4", package = "theiaR")

mycollection <- TheiaCollection$new(cart.path = cart.path,
                                    dir.path  = ".")

print(mycollection)

## ---- eval=TRUE----------------------------------------------------------
mycollection$status

## ---- eval=FALSE---------------------------------------------------------
#  mycollection$download(auth = myauth)

## ---- eval=FALSE---------------------------------------------------------
#  mycollection$download(auth = myauth, overwrite = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  file.path <- mycollection$extract()

