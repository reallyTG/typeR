## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ------------------------------------------------------------------------
library(europepmc)
europepmc::epmc_search('malaria')

## ------------------------------------------------------------------------
europepmc::epmc_search('malaria', synonym = FALSE)

## ------------------------------------------------------------------------
europepmc::epmc_search('"Human malaria parasites"')

## ------------------------------------------------------------------------
europepmc::epmc_search('"Human malaria parasites"', limit = 10)

## ------------------------------------------------------------------------
my_dois <- c(
  "10.1159/000479962",
  "10.1002/sctm.17-0081",
  "10.1161/strokeaha.117.018077",
  "10.1007/s12017-017-8447-9"
  )
  plyr::ldply(my_dois, function(x) {
  europepmc::epmc_search(paste0("DOI:", x))
  })

## ------------------------------------------------------------------------
europepmc::epmc_search('AUTH:"Salmon Maelle"')

## ------------------------------------------------------------------------
q <- 'AUTH:"PÜHLER Alfred" OR AUTH:"Pühler Alfred Prof. Dr." OR AUTH:"Puhler A"'
europepmc::epmc_search(q, limit = 1000)

## ------------------------------------------------------------------------
europepmc::epmc_search('AUTHORID:"0000-0002-7635-3473"', limit = 200, sort = "cited")

## ------------------------------------------------------------------------
europepmc::epmc_search('disease:meningitis')

## ------------------------------------------------------------------------
europepmc::epmc_search('(HAS_PDB:y) AND FIRST_PDATE:2016')

## ------------------------------------------------------------------------
europepmc::epmc_citations("9338777", limit = 500)

## ------------------------------------------------------------------------
europepmc::epmc_refs("28632490", limit = 200)

## ------------------------------------------------------------------------
europepmc::epmc_ftxt("PMC3257301")

