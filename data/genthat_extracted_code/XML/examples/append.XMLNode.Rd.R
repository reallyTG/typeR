library(XML)


### Name: append.xmlNode
### Title: Add children to an XML node
### Aliases: append.xmlNode append.XMLNode
### Keywords: file IO

### ** Examples

  # Create a very simple representation of a simple dataset.
  # This is just an example. The result is
   # <data numVars="2" numRecords="3">
   # <varNames>
   #  <string>
   #   A
   #  </string>
   #  <string>
   #   B
   #  </string>
   # </varNames>
   # <record>
   #  1.2 3.5
   # </record>
   # <record>
   #  20.2 13.9
   # </record>
   # <record>
   #  10.1 5.67
   # </record>
   # </data>


 n = xmlNode("data", attrs = c("numVars" = 2, numRecords = 3))
 n = append.xmlNode(n, xmlNode("varNames", xmlNode("string", "A"), xmlNode("string", "B")))
 n = append.xmlNode(n, xmlNode("record", "1.2 3.5"))
 n = append.xmlNode(n, xmlNode("record", "20.2 13.9"))
 n = append.xmlNode(n, xmlNode("record", "10.1 5.67"))

 print(n)


## Not run: 
##D    tmp <-  lapply(references, function(i) {
##D                                   if(!inherits(i, "XMLNode"))
##D                                     i <- xmlNode("reference", i)
##D                                   i
##D                               })
##D 
##D    r <- xmlNode("references")
##D    r[["references"]] <- append.xmlNode(r[["references"]], tmp)
## End(Not run)



