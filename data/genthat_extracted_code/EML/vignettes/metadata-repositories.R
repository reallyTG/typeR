## ----include=FALSE-------------------------------------------------------
knitr::opts_chunk$set(eval=FALSE)  ## We cannot authenticate automatically, so we cannot run code

## ----eval = FALSE--------------------------------------------------------
#  #install.packages("dataone", repos= c("https://cran.rstudio.com", "http://nceas.github.io/drat"))
#  
#  ## or
#  devtools::install_github(c("ropensci/datapack", "DataONEorg/rdataone"))

## ------------------------------------------------------------------------
#  library("dataone")
#  library("datapack")

## ------------------------------------------------------------------------
#  sampleData <- system.file("extdata/sample.csv", package="dataone")
#  sampleEML <- system.file("extdata/sample-eml.xml", package="dataone")

## ------------------------------------------------------------------------
#  dataObj <- new("DataObject", format="text/csv", file=sampleData)
#  metadataObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)

## ------------------------------------------------------------------------
#  accessRules <- data.frame(subject="CN=Noam Ross A45991,O=Google,C=US,DC=cilogon,DC=org", permission="write")
#  dataObj <- addAccessRule(dataObj, accessRules)
#  metadataObj <- addAccessRule(metadataObj, accessRules)

## ------------------------------------------------------------------------
#  dp <- new("DataPackage")
#  dp <- addData(dp, dataObj, metadataObj)

## ------------------------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- uploadDataPackage(d1c, dp)

## ------------------------------------------------------------------------
#  query(CNode("STAGING"), searchTerms = list(id = packageId))

## ----eval=FALSE----------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  newid <- generateIdentifier(mn, "DOI")

## ----eval = FALSE--------------------------------------------------------
#  eml <- read_eml(sampleEML)
#  eml@packageId <- newid
#  write_eml(eml, sampleEML)

## ----eval = FALSE--------------------------------------------------------
#  new("DataObject", id = newid, format = "eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)

