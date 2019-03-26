library(DataGraph)


### Name: DataGraph-package
### Title: Export Data from R so DataGraph can Read it
### Aliases: DataGraph-package DataGraph
### Keywords: package

### ** Examples

  ## Not run: 
##D      writeDTable("/tmp/test",mtcars)
##D 
##D      openDTable("/tmp/test2" name)
##D      addDTable("/tmp/test2",data frame)
##D      ...  modify the table
##D      addDTable("/tmp/test2",data frame)
##D      closeDTable("/tmp/test2")
##D 
##D      openDTBin("/tmp/test3")
##D      addDTBin("/tmp/test3","Cars",mtcars)
##D      addDTBin("/tmp/test3","Orange",Orange)
##D      infoDTBin("/tmp/test3")
##D      closeDTBin("/tmp/test3")
##D   
## End(Not run)



