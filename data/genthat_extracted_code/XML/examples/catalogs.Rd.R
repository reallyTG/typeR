library(XML)


### Name: catalogLoad
### Title: Manipulate XML catalog contents
### Aliases: catalogLoad catalogClearTable catalogAdd catalogDump
### Keywords: IO

### ** Examples

# Add a rewrite rule
# 
# 	
catalogAdd(c("http://www.omegahat.net/XML" = system.file("XML", package
= "XML")))
catalogAdd("http://www.omegahat.net/XML", system.file("XML", package =
"XML"))
catalogAdd("http://www.r-project.org/doc/",
           paste(R.home(), "doc", "", sep = .Platform$file.sep))
	
#
#          This shows how we can load a catalog and then resolve a
#          systemidentifier that it maps.
# 	
catalogLoad(system.file("exampleData", "catalog.xml", package = "XML"))
catalogResolve("docbook4.4.dtd", "system")
catalogResolve("-//OASIS//DTD DocBook XML V4.4//EN", "public")



