## ----setup, include = FALSE----------------------------------------------
library('knitr')
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('socialmixr')

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github('sbfnk/socialmixr')

## ----eval=FALSE----------------------------------------------------------
#  library('socialmixr')

## ----echo=FALSE----------------------------------------------------------
suppressWarnings(library('socialmixr'))

## ----eval=FALSE----------------------------------------------------------
#  ?contact_matrix

## ------------------------------------------------------------------------
data(polymod)

## ------------------------------------------------------------------------
contact_matrix(polymod, countries = "United Kingdom", age.limits = c(0, 1, 5, 15))

## ------------------------------------------------------------------------
list_surveys()

## ----eval=FALSE----------------------------------------------------------
#  peru <- get_survey(1)
#  saveRDS(peru, "peru.rds")

## ----eval=FALSE----------------------------------------------------------
#  peru <- readRDS("peru.rds")

## ------------------------------------------------------------------------
survey_countries(polymod)

## ------------------------------------------------------------------------
cite(polymod)

## ------------------------------------------------------------------------
m <- contact_matrix(polymod, countries = "United Kingdom", age.limits = c(0, 1, 5, 15), n=5)
length(m$matrices)
mr <- Reduce("+", lapply(m$matrices, function(x) {x$matrix})) / length(m$matrices)
mr

## ------------------------------------------------------------------------
contact_matrix(polymod, countries = "United Kingdom", age.limits = c(0, 1, 5, 15), symmetric = TRUE)

## ------------------------------------------------------------------------
contact_matrix(polymod, countries = "United Kingdom", age.limits = c(0, 1, 5, 15), split = TRUE)

## ----fig.width=5, fig.height=5, tidy=TRUE--------------------------------
library('reshape2')
library('ggplot2')
df <- melt(mr, varnames = c("age1", "age2"), value.name = "contacts")
ggplot(df, aes(x = age2, y = age1, fill = contacts)) + theme(legend.position="bottom") + geom_tile()

