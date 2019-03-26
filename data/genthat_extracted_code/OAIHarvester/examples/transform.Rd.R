library(OAIHarvester)


### Name: transform
### Title: Transform OAI-PMH XML Results
### Aliases: oaih_transform

### ** Examples

baseurl <- "http://epub.wu.ac.at/cgi/oai2"
## Get a single record to save bandwidth.
x <- oaih_get_record(baseurl,
                     "oai:epub.wu-wien.ac.at:852",
                     transform = FALSE)
## The result of the request is a single OAI-PMH XML <record> node:
x
## Transform this (turning identifier, datestamp and setSpec into
## character data):
x <- oaih_transform(x)
x    
## This has its metadata in the default Dublin Core form, encoded in
## XML.  Transform these to character data:
oaih_transform(x$metadata)



