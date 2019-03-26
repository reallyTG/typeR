## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("cboettig/emld")

## ------------------------------------------------------------------------
library(emld)
library(jsonlite)
library(magrittr)

## ------------------------------------------------------------------------
f <- system.file("extdata/example.xml", package="emld")
eml <- as_emld(f)
eml$dataset$title

## ------------------------------------------------------------------------

me <- list(individualName = list(givenName = "Carl", surName = "Boettiger"))

eml <- list(dataset = list(
              title = "dataset title",
              contact = me,
              creator = me),
              system = "doi",
              packageId = "10.xxx")

ex.xml <- tempfile("ex", fileext = ".xml") # use your preferred file path

as_xml(eml, ex.xml)
testthat::expect_true(eml_validate(ex.xml) )

## ------------------------------------------------------------------------
library(jqr)
hf205 <- system.file("extdata/hf205.xml", package="emld")

as_emld(hf205) %>% 
  as_json() %>% 
  jq('.dataset.coverage.geographicCoverage.boundingCoordinates | 
       { northLat: .northBoundingCoordinate, 
         southLat: .southBoundingCoordinate }') %>%
  fromJSON()

## ------------------------------------------------------------------------
library(rdflib)

## ------------------------------------------------------------------------
f <- system.file("extdata/hf205.xml", package="emld")
hf205.json <- tempfile("hf205", fileext = ".json") # Use your preferred filepath

as_emld(f) %>%
as_json(hf205.json)

prefix <- paste0("PREFIX eml: <eml://ecoinformatics.org/", eml_version(), "/>\n")
sparql <- paste0(prefix, '

  SELECT ?genus ?species ?northLat ?southLat ?eastLong ?westLong 

  WHERE { 
    ?y eml:taxonRankName "genus" .
    ?y eml:taxonRankValue ?genus .
    ?y eml:taxonomicClassification ?s .
    ?s eml:taxonRankName "species" .
    ?s eml:taxonRankValue ?species .
    ?x eml:northBoundingCoordinate ?northLat .
    ?x eml:southBoundingCoordinate ?southLat .
    ?x eml:eastBoundingCoordinate ?eastLong .
    ?x eml:westBoundingCoordinate ?westLong .
  }
')

  
rdf <- rdf_parse(hf205.json, "jsonld")
df <- rdf_query(rdf, sparql)
df

