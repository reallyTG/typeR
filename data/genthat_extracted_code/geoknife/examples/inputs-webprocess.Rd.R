library(geoknife)


### Name: inputs<-
### Title: inputs of webprocess
### Aliases: inputs<- inputs inputs,webprocess-method
###   inputs,xml_document-method inputs<-,webprocess,missing-method
###   inputs<-,webprocess,character-method inputs<-,webprocess,list-method
### Keywords: internal

### ** Examples

wp <- webprocess(DELIMITER = 'TAB')
inputs(wp)

inputs(wp) <- list(DELIMITER = 'COMMA', SUMMARIZE_FEATURE_ATTRIBUTE = 'false')
inputs(wp)
inputs(wp, "DELIMITER")
inputs(wp, "DELIMITER") <- "TAB"



