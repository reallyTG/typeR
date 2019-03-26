library(XML)


### Name: XMLCodeFile-class
### Title: Simple classes for identifying an XML document containing R code
### Aliases: XMLCodeFile-class XMLCodeDoc-class xmlCodeFile
###   [[,XMLCodeFile-method [[,XMLCodeFile,ANY-method
###   coerce,XMLCodeFile,XMLCodeDoc-method
###   coerce,character,XMLCodeDoc-method
###   coerce,character,XMLCodeFile-method source,XMLCodeFile-method
### Keywords: classes

### ** Examples

 src =  system.file("exampleData", "Rsource.xml", package = "XML")
   # mark the string as an XML file containing R code
 k = xmlCodeFile(src)

   # read and parse the code, but don't evaluate it.
 code = xmlSource(k, eval = FALSE)

   # read and evaluate the code in a special environment.
 e = new.env()
 ans = xmlSource(k, envir = e)
 ls(e)



