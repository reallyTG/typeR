library(ODB)


### Name: odb.close
### Title: Closes an "ODB" connection and updates the .odb file
### Aliases: odb.close

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



