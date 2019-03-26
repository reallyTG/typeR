library(XML)


### Name: catalogResolve
### Title: Look up an element via the XML catalog mechanism
### Aliases: catalogResolve
### Keywords: IO

### ** Examples


if(!exists("Sys.setenv")) Sys.setenv = Sys.putenv

Sys.setenv("XML_CATALOG_FILES" = system.file("exampleData", "catalog.xml", package = "XML"))



catalogResolve("-//OASIS//DTD DocBook XML V4.4//EN", "public")

catalogResolve("http://www.omegahat.net/XSL/foo.xsl")

catalogResolve("http://www.omegahat.net/XSL/article.xsl", "uri")
catalogResolve("http://www.omegahat.net/XSL/math.xsl", "uri")


  # This one does not resolve anything, returning an empty value.
catalogResolve("http://www.oasis-open.org/docbook/xml/4.1.2/foo.xsl", "uri")


   # Vectorized and returns NA for the first and /tmp/html.xsl
   # for the second.

 catalogAdd("http://made.up.domain", "/tmp")
 catalogResolve(c("ddas", "http://made.up.domain/html.xsl"), asIs = TRUE)



