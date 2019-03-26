library(ODB)


### Name: odb.read
### Title: Executes a reading SQL query in an ODB database (SELECT ...)
### Aliases: odb.read

### ** Examples

  # New empty .odb file
  odb.create("test.odb", overwrite="do")
  odb <- odb.open("test.odb")
  
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
  
  # Read content
  print(odb.read(odb, "SELECT * FROM fruits"))
  
  # Writes to the file and closes the connection
  odb.close(odb, write=TRUE)



