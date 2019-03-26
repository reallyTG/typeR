library(ODB)


### Name: odb.comments
### Title: Gets or sets column comments in an ODB database
### Aliases: odb.comments odb.comments<-

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  ODB <- odb.open("test.odb")
  
  # New tables
  SQL <- c(
    "CREATE TABLE fruits (
      name VARCHAR(6) PRIMARY KEY,
      color VARCHAR(32)
      )",
    "CREATE TABLE vegetables (
      name VARCHAR(6) PRIMARY KEY,
      color VARCHAR(32)
      )"
    )
  odb.write(ODB, SQL)
  
  # Setting a single comment
  odb.comments(ODB,
    tableNames = "fruits",
    columnNames = "name"
  ) <- "Fruit names"
  print(odb.comments(ODB))
  
  # Setting two comments in the same table
  odb.comments(ODB,
    tableNames = "fruits",
    columnNames = c("name", "color")
  ) <- "Fruit columns"
  print(odb.comments(ODB))
  
  # Setting two distinct comments
  odb.comments(ODB,
    tableNames = c("fruits", "vegetables"),
    columnNames = c("name", "color")
  ) <- c("Fruit names", "Vegetable colors")
  print(odb.comments(ODB))
  
  # Writes to the file and closes the connection
  odb.close(ODB, write=TRUE)



