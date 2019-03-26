## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(fslr)

## ------------------------------------------------------------------------
if (have.fsl()) {
  print(fsl_version())
}

