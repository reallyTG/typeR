## ---- eval=FALSE---------------------------------------------------------
#  install.packages("detzrcr")

## ---- eval=FALSE---------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github(magnuskristoffersen/detzrcr)

## ---- eval=FALSE---------------------------------------------------------
#  library("detzrcr")
#  run_detzrcr()

## ---- echo=FALSE, results='asis'-----------------------------------------
dat <- read.csv('karoo.csv')
knitr::kable(head(dat, 5), format='pandoc', caption='Example input format')

