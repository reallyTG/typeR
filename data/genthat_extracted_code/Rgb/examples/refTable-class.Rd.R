library(Rgb)


### Name: refTable-class
### Title: Class '"refTable"'
### Aliases: refTable-class
### Keywords: classes

### ** Examples

  # New empty refTable
  tab <- new("refTable")
  tab$addColumn(1:5, "C1")
  tab$addColumn(letters[1:5], "C2")
  tab$setRowNames(LETTERS[11:15])
  
  # New filled refTable (same content)
  tab <- refTable(C1=1:5, C2=letters[1:5], row.names=LETTERS[11:15])
  
  # Whole table print
  print(tab$extract())
  
  # Data update
  tab$fill(c(2,4), 2, c("B","D"))
  
  # Data extraction
  print(tab$extract(1:3))
  print(tab$extract(c(TRUE, FALSE)))
  print(tab$extract("K", "C1"))
  
  # Expression-based extraction
  expr <- expression(C1 %% 2 == 1)
  print(tab$extract(expr))
  
  # Table extension
  tab$addEmptyRows(5L, LETTERS[1:5])
  tab$fill(6:10, "C1", 6:10)
  print(tab$extract())
  
  # Filling from R objects
  tab <- new("refTable")
  print(tab$extract())
  tab$addVectors(C1=1:5, C2=letters[1:5])
  print(tab$extract())
  tab$addList(list(C1=6:8, C3=LETTERS[6:8]))
  print(tab$extract())
  
  # Beware of recycling !
  tab$addVectors(C1=9:15, C3=LETTERS[9:10])
  print(tab$extract())



