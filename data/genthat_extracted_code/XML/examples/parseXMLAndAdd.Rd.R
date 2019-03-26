library(XML)


### Name: parseXMLAndAdd
### Title: Parse XML content and add it to a node
### Aliases: parseXMLAndAdd
### Keywords: IO

### ** Examples

  long = runif(10000, -122, -80)
  lat = runif(10000, 25, 48)

  txt = sprintf("<Placemark><Point><coordinates>%.3f,%.3f,0</coordinates></Point></Placemark>",
                  long, lat)
  f = newXMLNode("Folder")
  parseXMLAndAdd(txt, f)
  xmlSize(f)


## Not run: 
##D       # this version is much slower as i) we don't vectorize the
##D       #  creation of the XML nodes, and ii) the parsing of the XML
##D       # as a string is very fast as it is done in C.
##D   f = newXMLNode("Folder")
##D   mapply(function(a, b) {
##D            newXMLNode("Placemark", 
##D                        newXMLNode("Point", 
##D                                    newXMLNode("coordinates", 
##D                                                paste(a, b, "0", collapse = ","))), 
##D 		       parent = f)
##D            },
##D          long, lat) 
##D   xmlSize(f)
##D 
##D 
##D   o = c("<x>dog</x>", "<omg:x>cat</omg:x>")
##D   node = parseXMLAndAdd(o, nsDefs  = c("http://cran.r-project.org",
##D                                        omg = "http://www.omegahat.net"))
##D   xmlNamespace(node[[1]])
##D   xmlNamespace(node[[2]])
##D 
##D   tt = newXMLNode("myTop")
##D   node = parseXMLAndAdd(o, tt, nsDefs  = c("http://cran.r-project.org",
##D                                            omg = "http://www.omegahat.net"))
##D   tt
## End(Not run)





