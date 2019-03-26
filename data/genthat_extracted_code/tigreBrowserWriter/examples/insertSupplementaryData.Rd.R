library(tigreBrowserWriter)


### Name: insertSupplementaryData
### Title: Insert supplementary data
### Aliases: insertSupplementaryData

### ** Examples

  db <- initializeDb("", "My Dataset")
  suppdata <- c(1, 2, 3)
  names(suppdata) <- c("A", "B", "C")
  db <- insertSupplementaryData(db, "supptest", suppdata)
  boolsupp <- c(TRUE, TRUE, FALSE)
  names(boolsupp) <- names(suppdata)
  db <- insertSupplementaryData(db, "supptest_bool", boolsupp)
  closeDb(db)



