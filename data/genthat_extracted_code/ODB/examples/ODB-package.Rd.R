library(ODB)


### Name: ODB-package
### Title: Open Document Databases (.odb) management
### Aliases: ODB-package ODB

### ** Examples


  ## CONNECTION ##
  
  # Creation of a new .odb database
  odb.create("test.odb", overwrite="do")

  # Connection to the file
  odb <- odb.open("test.odb")
  
  
  ## STRUCTURE ##
  
  # Creation of a new table
  SQL <- "CREATE TABLE fruits (id INTEGER PRIMARY KEY, value VARCHAR(8))"
  odb.write(odb, SQL)
  
  # Addition of comments on columns
  odb.comments(odb, "fruits", c("id", "value")) <- c("Fruit rank", "Fruit name")
  
  # Printing of the database structure
  print(odb.tables(odb))
  
  # Printing of a specific comment
  print(odb.comments(odb, "fruits", "value"))
  
  
  ## DATA ##
  
  # Insertion of data
  data <- data.frame(id=1:3, value=c("apple", "orange", "pear"))
  odb.insert(odb, tableName="fruits", data=data, execute=TRUE)
  
  # Reading
  print(odb.read(odb, "SELECT * FROM fruits WHERE id=2"))
  
  # Saved query
  odb.queries(odb, "2nd record") <- "SELECT * FROM fruits WHERE id=2"
  print(odb.read(odb, odb.queries(odb, "2nd record")))
  
  # SQL export
  odb.export(odb, "test.sql")
  
  
  ## DISCONNECTION ##
  
  # Is the connection closed ?
  print(isClosed(odb))
  
  # Save changes in the .odb file
  odb.close(odb, write=TRUE)
  
  # And now ?
  print(isClosed(odb))



