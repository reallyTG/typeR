library(OAIHarvester)


### Name: serialize
### Title: Serialization for OAI-PMH Objects
### Aliases: oaih_read_RDS oaih_save_RDS oaih_str_to_xml oaih_xml_to_str

### ** Examples

baseurl <- "http://epub.wu.ac.at/cgi/oai2"
x <- oaih_identify(baseurl)
## Now 'x' is a list of character vectors and XML nodes:
x
## To save to a file and restore:
f <- tempfile()
oaih_save_RDS(x, file = f)
y <- oaih_read_RDS(f)
all.equal(x, y)
## Equivalently, we can directly pre-process before saving and
## post-process after restoring:
saveRDS(oaih_xml_to_str(x), f)
z <- oaih_str_to_xml(readRDS(f))
all.equal(y, z)



