## ------------------------------------------------------------------------
library(simulator)
dir <- "./sims"
create(dir)

## ---- eval=FALSE---------------------------------------------------------
#  setwd(dir)
#  list.files()

## ---- echo=FALSE---------------------------------------------------------
list.files(dir)

## ---- eval = FALSE-------------------------------------------------------
#  rmarkdown::render("writeup.Rmd", "html_document")

## ---- echo = FALSE-------------------------------------------------------
# delete all files created in running this vignette 
unlink(dir, recursive = TRUE)

