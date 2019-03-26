## ------------------------------------------------------------------------
library(dataone)
library(datapack)
library(uuid)

dp <- new("DataPackage")

emlFile <- system.file("extdata/strix-pacific-northwest.xml", package="dataone")
metadataObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", filename=emlFile)
dp <- addMember(dp, metadataObj)

sourceData <- system.file("extdata/OwlNightj.csv", package="dataone")
sourceObj <- new("DataObject", format="text/csv", filename=sourceData) 
dp <- addMember(dp, sourceObj, metadataObj)

progFile <- system.file("extdata/filterObs.R", package="dataone")
progObj <- new("DataObject", format="application/R", filename=progFile, mediaType="text/x-rsrc")
dp <- addMember(dp, progObj, metadataObj)

outputData <- system.file("extdata/Strix-occidentalis-obs.csv", package="dataone")
outputObj <- new("DataObject", format="text/csv", filename=outputData) 
dp <- addMember(dp, outputObj, metadataObj)

myAccessRules <- data.frame(subject="http://orcid.org/0000-0002-2192-403X", permission="changePermission") 


## ---- eval=FALSE---------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- uploadDataPackage(d1c, dp, public=TRUE, accessRules=myAccessRules, quiet=FALSE)

## ------------------------------------------------------------------------
library(dataone)
library(datapack)
library(uuid)

dp <- new("DataPackage")

## ------------------------------------------------------------------------
emlFile <- system.file("extdata/strix-pacific-northwest.xml", package="dataone")
metadataObj <- new("DataObject", format="eml://ecoinformatics.org/eml-2.1.1", filename=emlFile)

## ------------------------------------------------------------------------
dp <- addMember(dp, metadataObj)

## ---- eval=FALSE---------------------------------------------------------
#  dp <- addMember(dp, sourceObj, metadataObj)

## ---- eval=FALSE---------------------------------------------------------
#  dp <- addMember(dp, metadataObj)
#  dp <- addMember(dp, sourceObj)
#  dp <- insertRelationship(dp, getIdentifier(metadataObj), getIdentifier(sourceObj))

## ------------------------------------------------------------------------
sourceData <- system.file("extdata/OwlNightj.csv", package="dataone")
sourceObj <- new("DataObject", format="text/csv", filename=sourceData) 
dp <- addMember(dp, sourceObj, metadataObj)

## ------------------------------------------------------------------------
progFile <- system.file("extdata/filterObs.R", package="dataone")
progObj <- new("DataObject", format="application/R", filename=progFile, mediaType="text/x-rsrc")
dp <- addMember(dp, progObj, mo=metadataObj)

outputData <- system.file("extdata/Strix-occidentalis-obs.csv", package="dataone")
outputObj <- new("DataObject", format="text/csv", filename=outputData) 
dp <- addMember(dp, outputObj, mo=metadataObj)

## ------------------------------------------------------------------------
sourceObj <- setPublicAccess(sourceObj)

## ------------------------------------------------------------------------
myAccessRules <- data.frame(subject="http://orcid.org/0000-0002-2192-403X", permission="changePermission") 
sourceObj <- addAccessRule(sourceObj, myAccessRules)

## ---- eval=FALSE---------------------------------------------------------
#  d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
#  packageId <- uploadDataPackage(d1c, dp, public=TRUE, accessRules=myAccessRules, quiet=FALSE)
#  message(sprintf("Uploaded package with identifier: %s", packageId))

## ---- eval=FALSE---------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  doi <- generateIdentifier(mn, "DOI")
#  metadataObj <- new("DataObject", id=doi, format="eml://ecoinformatics.org/eml-2.1.1", file=sampleEML)

## ------------------------------------------------------------------------
library(digest)
# Create a system metadata object for a data file. 
# Just for demonstration purposes, create a temporary data file.
testdf <- data.frame(x=1:20,y=11:30)
csvfile <- paste(tempfile(), ".csv", sep="")
write.csv(testdf, csvfile, row.names=FALSE)
format <- "text/csv"
size <- file.info(csvfile)$size
sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
# Generate a unique identifier for the dataset
pid <- sprintf("urn:uuid:%s", UUIDgenerate())
sysmeta <- new("SystemMetadata", identifier=pid, formatId=format, size=size, checksum=sha1)
sysmeta <- addAccessRule(sysmeta, "public", "read")

## ------------------------------------------------------------------------
# Create a system metadata object for a data file. 
# Just for demonstration purposes, create a temporary data file.
testdf <- data.frame(x=1:20,y=11:30)
csvfile <- paste(tempfile(), ".csv", sep="")
write.csv(testdf, csvfile, row.names=FALSE)
format <- "text/csv"
size <- file.info(csvfile)$size
sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
# Generate a unique identifier for the dataset
pid <- sprintf("urn:uuid:%s", UUIDgenerate())
# The seriesId can be any unique character string.
seriesId <- sprintf("urn:uuid:%s", UUIDgenerate())
sysmeta <- new("SystemMetadata", identifier=pid, formatId=format, size=size, checksum=sha1,  seriesId=seriesId)

## ----eval=F--------------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  response <- createObject(mn, pid, csvfile, sysmeta)

## ---- eval=F-------------------------------------------------------------
#  cn <- CNode("STAGING")
#  mn <- getMNode(cn, "urn:node:mnStageUCSB2")
#  sysmeta <- getSystemMetadata(mn, pid)
#  sysmeta <- addAccessRule(sysmeta, "public", "read")
#  status <- updateSystemMetadata(mn, pid, sysmeta)

## ---- eval=F-------------------------------------------------------------
#  # Update object from previous example with a new version
#  updateid <- sprintf("urn:uuid:%s", UUIDgenerate())
#  testdf <- data.frame(x=1:20,y=11:30)
#  csvfile <- paste(tempfile(), ".csv", sep="")
#  write.csv(testdf, csvfile, row.names=FALSE)
#  size <- file.info(csvfile)$size
#  sha1 <- digest(csvfile, algo="sha1", serialize=FALSE, file=TRUE)
#  # Start with the old object's sysmeta, then modify it to match
#  # the new object. We could have also created a sysmeta from scratch.
#  sysmeta <- getSystemMetadata(mn, pid)
#  sysmeta@identifier <- updateid
#  sysmeta@size <- size
#  sysmeta@checksum <- sha1
#  sysmeta@obsoletes <- pid
#  # Now update the object on the member node.
#  response <- updateObject(mn, pid, csvfile, updateid, sysmeta)
#  # Get the new, updated sysmeta and check it to ensure that the update
#  # worked, i.e. "obsoletes" is the old pid that was replaced by the update.
#  updsysmeta <- getSystemMetadata(mn, updateid)
#  updsysmeta@obsoletes

## ---- eval=FALSE---------------------------------------------------------
#  response <- archive(mn, updateid)

## ---- eval=FALSE---------------------------------------------------------
#  sysmeta <- getSystemMetadata(mn, updateid)
#  sysmeta@archived

