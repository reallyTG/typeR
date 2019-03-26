library(tigreBrowserWriter)


### Name: insertAliases
### Title: Insert aliases
### Aliases: insertAliases

### ** Examples

  db <- initializeDb("", "My Dataset")
  aliases <- c("aliasA", "aliasB", "aliasC")
  names(aliases) <- c("A", "B", "C")
  db <- insertAliases(db, "testalias", aliases)
  closeDb(db)



