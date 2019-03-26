library(ODB)


### Name: odb.create
### Title: Creates a .odb empty file.
### Aliases: odb.create

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # Empty template
  print(odb.tables(odb))
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)
  
  
  # Use as template
  odb.create("test2.odb", template="test.odb", overwrite="do")
  odb <- odb.open("test2.odb")
  print(odb.tables(odb))
  odb.close(odb, write=TRUE)



