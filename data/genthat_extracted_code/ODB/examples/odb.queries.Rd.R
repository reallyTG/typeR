library(ODB)


### Name: odb.queries
### Title: Gets or sets stored queries in an ODB database
### Aliases: odb.queries odb.queries<-

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  # New table
  odb.write(odb, "CREATE TABLE fruits (name VARCHAR(6) PRIMARY KEY)")
  odb.insert(odb, "fruits", c("banana", "pear", "peach"))
  
  # Single query
  odb.queries(odb, "banana") = "SELECT * FROM fruits WHERE name='banana'"
  print(odb.read(odb, odb.queries(odb, "banana")))
  
  # Multiple queries
  odb.queries(odb, c("banana","pear")) <- c(
    "SELECT * FROM fruits WHERE name='banana'",
    "SELECT * FROM fruits WHERE name='pear'"
  )
  
  # All queries
  print(odb.queries(odb))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



