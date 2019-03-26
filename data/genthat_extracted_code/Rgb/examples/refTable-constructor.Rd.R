library(Rgb)


### Name: refTable-constructor
### Title: refTable class constructor
### Aliases: refTable

### ** Examples

  # From vectors
  tab <- refTable(colA=1:5, colB=letters[1:5])
  print(tab$extract(3,))
  
  # From list (recycling)
  columns <- list(number=1, letters=LETTERS)
  tab <- refTable(columns)
  print(tab$extract())
  
  # data.frame conversion
  dataFrame <- data.frame(colA=1:5, colB=letters[1:5])
  tab <- refTable(dataFrame)
  print(tab$extract())



