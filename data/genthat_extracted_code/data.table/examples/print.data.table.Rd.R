library(data.table)


### Name: print.data.table
### Title: data.table Printing Options
### Aliases: print.data.table

### ** Examples

  #output compression
  DT <- data.table(a = 1:1000)
  print(DT, nrows = 100, topn = 4)

  #`quote` can be used to identify whitespace
  DT <- data.table(blanks = c(" 12", " 34"),
                   noblanks = c("12", "34"))
  print(DT, quote = TRUE)

  #`class` provides handy column type summaries at a glance
  DT <- data.table(a = vector("integer", 3),
                   b = vector("complex", 3),
                   c = as.IDate(paste0("2016-02-0", 1:3)))
  print(DT, class = TRUE)

  #`row.names` can be eliminated to save space
  DT <- data.table(a = 1:3)
  print(DT, row.names = FALSE)

  #`print.keys` can alert which columns are currently keys
  DT <- data.table(a=1:3, b=4:6, c=7:9, key="b,a")
  setindexv(DT, c("a", "b"))
  setindexv(DT, "a")
  print(DT, print.keys=TRUE)



