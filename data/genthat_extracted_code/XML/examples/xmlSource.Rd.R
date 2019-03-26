library(XML)


### Name: xmlSource
### Title: Source the R code, examples, etc. from an XML document
### Aliases: xmlSource xmlSource,character-method
###   xmlSource,XMLNodeSet-method xmlSource,XMLInternalDocument-method
###   xmlSourceFunctions xmlSourceFunctions,character-method
###   xmlSourceFunctions,XMLInternalDocument-method xmlSourceSection
###   xmlSourceSection,character-method
###   xmlSourceSection,XMLInternalDocument-method xmlSourceThread
###   xmlSourceThread,XMLInternalDocument-method
###   xmlSourceThread,character-method xmlSourceThread,list-method
### Keywords: IO programming

### ** Examples

 xmlSource(system.file("exampleData", "Rsource.xml", package="XML"))

  # This illustrates using r:frag nodes.
  # The r:frag nodes are not processed directly, but only
  # if referenced in the contents/body of a r:code node
 f = system.file("exampleData", "Rref.xml", package="XML")
 xmlSource(f)



