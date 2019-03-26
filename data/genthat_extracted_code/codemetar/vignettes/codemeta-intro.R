## ----include=FALSE-------------------------------------------------------
knitr::opts_chunk$set(comment="")
if(grepl("windows", tolower(Sys.info()[["sysname"]])))
  knitr::opts_chunk$set(comment="", error =TRUE)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("codemeta/codemetar")

## ------------------------------------------------------------------------
library("codemetar")

## ----example-------------------------------------------------------------
write_codemeta("testthat")

## ------------------------------------------------------------------------
write_codemeta(find.package("codemetar"))

## ----echo = FALSE--------------------------------------------------------
cat(readLines("codemeta.json"), sep="\n")

## ----include=FALSE-------------------------------------------------------
#unlink("codemeta.json")

