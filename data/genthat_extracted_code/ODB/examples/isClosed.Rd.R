library(ODB)


### Name: isClosed
### Title: Checks if a DBI connection is closed
### Aliases: isClosed

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  ODB <- odb.open("test.odb")
  
  # Is the connection closed ?
  print(isClosed(ODB))
  
  # Save changes in the .odb file
  odb.close(ODB, write=TRUE)
  
  # And now ?
  print(isClosed(ODB))



