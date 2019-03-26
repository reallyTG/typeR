library(XML)


### Name: xmlParseDoc
### Title: Parse an XML document with options controlling the parser.
### Aliases: xmlParseDoc COMPACT DTDATTR DTDLOAD DTDVALID HUGE NOBASEFIX
###   NOBLANKS NOCDATA NODICT NOENT NOERROR NONET NOWARNING NOXINCNODE
###   NSCLEAN OLDSAX PEDANTIC RECOVER XINCLUDE OLD10 SAX1
### Keywords: data

### ** Examples

 f = system.file("exampleData", "mtcars.xml", package="XML")
     # Same as xmlParse()
 xmlParseDoc(f)

 txt =
     '<top xmlns:r="http://www.r-project.org">
        <b xmlns:r="http://www.r-project.org">
          <c xmlns:omg="http:/www.omegahat.net"/>
        </b>
      </top>'

 xmlParseDoc(txt,  NSCLEAN, asText = TRUE)

 txt =
     '<top xmlns:r="http://www.r-project.org"  xmlns:r="http://www.r-project.org">
        <b xmlns:r="http://www.r-project.org">
          <c xmlns:omg="http:/www.omegahat.net"/>
        </b>
      </top>'

 xmlParseDoc(txt, c(NSCLEAN, NOERROR), asText = TRUE)



