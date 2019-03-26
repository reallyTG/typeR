library(ODB)


### Name: odb.export
### Title: Exports an ODB database to a SQL file.
### Aliases: odb.export

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  
  # Export to a file
  odb.export(odb, "fruits.sql")
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



