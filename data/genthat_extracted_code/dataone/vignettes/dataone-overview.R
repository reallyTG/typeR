## ------------------------------------------------------------------------
library(dataone)
cn <- CNode("PROD")
mn <- getMNode(cn, "urn:node:KNB")
mySearchTerms <- list(q="abstract:salmon+AND+keywords:acoustics+AND+keywords:\"Oncorhynchus nerka\"",
                      fl="id,title,dateUploaded,abstract,size",
                      fq="dateUploaded:[2013-01-01T00:00:00.000Z TO 2014-01-01T00:00:00.000Z]",
                      sort="dateUploaded+desc")
result <- query(mn, solrQuery=mySearchTerms, as="data.frame")
result[1,c("id", "title")]
pid <- result[1,'id']

## ------------------------------------------------------------------------
library(XML)
metadata <- rawToChar(getObject(mn, pid))

## ------------------------------------------------------------------------
dataRaw <- getObject(mn, "df35d.443.1")
dataChar <- rawToChar(dataRaw)
theData <- textConnection(dataChar)
df <- read.csv(theData, stringsAsFactors=FALSE)
df[1,]

## ------------------------------------------------------------------------
library(datapack)
library(uuid)
d1c <- D1Client("STAGING", "urn:node:mnStageUCSB2")
id <- paste("urn:uuid:", UUIDgenerate(), sep="")
testdf <- data.frame(x=1:10,y=11:20)
csvfile <- paste(tempfile(), ".csv", sep="")
write.csv(testdf, csvfile, row.names=FALSE)
# Build a DataObject containing the csv, and upload it to the Member Node
d1Object <- new("DataObject", id, format="text/csv", filename=csvfile)

## ---- eval=FALSE---------------------------------------------------------
#  uploadDataObject(d1c, d1Object, public=TRUE)

