library(ODB)


### Name: odb.open
### Title: Creates a connection to a .odb file
### Aliases: odb.open

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



