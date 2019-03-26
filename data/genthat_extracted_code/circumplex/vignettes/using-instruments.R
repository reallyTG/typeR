## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(circumplex)

## ------------------------------------------------------------------------
instruments()

## ------------------------------------------------------------------------
instrument(csip)
print(csip)

## ---- error=TRUE---------------------------------------------------------
print(isc)

## ------------------------------------------------------------------------
instrument(isc)
print(isc)

## ------------------------------------------------------------------------
instrument("ipipipc")
summary(ipipipc)

## ------------------------------------------------------------------------
anchors(ipipipc)

## ------------------------------------------------------------------------
norms(ipipipc)

## ------------------------------------------------------------------------
scales(ipipipc, items = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  View(ipipipc)

## ---- echo=FALSE, out.width='100%'---------------------------------------
knitr::include_graphics("./view_ipipipc.png")

## ------------------------------------------------------------------------
data("raw_iipsc")
print(raw_iipsc)

## ------------------------------------------------------------------------
ips_iipsc <- ipsatize(.data = raw_iipsc, items = IIP01:IIP32, na.rm = TRUE, overwrite = TRUE)
print(ips_iipsc)

## ------------------------------------------------------------------------
round(rowMeans(raw_iipsc, na.rm = TRUE), 2)
round(rowMeans(ips_iipsc, na.rm = TRUE), 2)

## ------------------------------------------------------------------------
instrument("iipsc")
scales(iipsc)

## ------------------------------------------------------------------------
scale_scores <- score(.data = raw_iipsc, items = IIP01:IIP32, instrument = iipsc)
print(scale_scores)

## ------------------------------------------------------------------------
select(scale_scores, PA:NO)

## ------------------------------------------------------------------------
norms(iipsc)

## ------------------------------------------------------------------------
z_scales <- standardize(
  .data = scale_scores, 
  scales = PA:NO, 
  angles = octants(),
  instrument = iipsc,
  sample = 1
)
print(z_scales)

## ------------------------------------------------------------------------
select(z_scales, PA_z:NO_z)

