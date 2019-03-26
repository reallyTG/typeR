library(ODB)


### Name: odb.write
### Title: Executes writing SQL queries in an ODB database (INSERT ...)
### Aliases: odb.write

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  print(odb.tables(odb))
  
  # Manual insert
  odb.write(odb, "INSERT INTO fruits VALUES('apple')")
  print(odb.read(odb, "SELECT * FROM fruits"))
  
  # Remove table
  odb.write(odb, "DROP TABLE fruits")
  print(odb.tables(odb))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



