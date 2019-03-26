library(dataone)


### Name: getFormat
### Title: Get information for a single DataONE object format
### Aliases: getFormat getFormat,CNode-method

### ** Examples

library(dataone)
cn <- CNode()
fmt <- getFormat(cn, "eml://ecoinformatics.org/eml-2.1.0")
cat(sprintf("format name: %s\n", fmt$name))
cat(sprintf("format type: %s\n", fmt$type))
cat(sprintf("format Id: %s\n", fmt$id))



