## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(SK)
data(vtest)
data(vehicles)
head(vehicles@data)[1:4,]

## ---- eval = FALSE-------------------------------------------------------
#  sok1 <- skriging(heavy ~ 1, polyline = vtest, method = "sok",
#                   lwd = "width", obspred = "obs1pred0", boxcox = TRUE)
#  sok1
#  plot(sok1)

## ---- eval = FALSE-------------------------------------------------------
#  srk1 <- skriging(heavy ~ wpai + width, polyline = vtest, method = "srk",
#                   lwd = "width", obspred = "obs1pred0", boxcox = TRUE)
#  srk1
#  plot(srk1)

## ---- eval = FALSE-------------------------------------------------------
#  data(vehicles)
#  sok2 <- skriging(heavy ~ 1, polyline = vehicles, method = "sok",
#                   lwd = "width", obspred = "obs1pred0", boxcox = TRUE)
#  sok2
#  plot(sok2, studyarea = wheatbelt)

## ---- fig.show="hold", fig.height=4, fig.width=10------------------------
srk2 <- skriging(heavy ~ wpai + width, polyline = vehicles, method = "srk", 
                 lwd = "width", obspred = "obs1pred0", boxcox = TRUE)
srk2
plot(srk2, studyarea = wheatbelt)

