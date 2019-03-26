library(ODB)


### Name: odb.tables
### Title: Gets description of every table in an ODB database.
### Aliases: odb.tables

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
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
  odb.write(odb, SQL)
  
  # Print tables
  print(odb.tables(odb))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



