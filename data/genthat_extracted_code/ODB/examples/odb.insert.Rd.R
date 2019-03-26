library(ODB)


### Name: odb.insert
### Title: Wrapper for inserting data in an ODB table.
### Aliases: odb.insert

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
  
  ## CASE-INSENSITIVE
  
  # New table
  SQL <- "CREATE TABLE fruits (
    name VARCHAR(6) PRIMARY KEY,
    color VARCHAR(32)
  )"
  odb.write(odb, SQL)
  
  # Data insertion
  dat <- data.frame(
    c("banana", "pear", "peach"),
    c("yellow", "yellow", "purple")
  )
  odb.insert(odb, "fruits", dat)
  
  # Check content
  print(odb.read(odb, "SELECT * FROM fruits"))
  
  
  ## CASE-SENSITIVE
  
  # New table
  SQL <- "CREATE TABLE \"Fruits\" (
    name VARCHAR(6) PRIMARY KEY,
    color VARCHAR(32)
  )"
  odb.write(odb, SQL)
  
  # Data insertion
  dat <- data.frame(
    c("banana", "pear", "peach"),
    c("yellow", "yellow", "purple")
  )
  odb.insert(odb, "\"Fruits\"", dat)
  
  # Check content
  print(odb.read(odb, "SELECT * FROM \"Fruits\""))
  
  
  # Notice they are distinct tables
  print(odb.tables(odb))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



