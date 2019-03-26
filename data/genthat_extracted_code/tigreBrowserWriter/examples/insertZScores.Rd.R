library(tigreBrowserWriter)


### Name: insertZScores
### Title: Insert data z-scores used for filtering
### Aliases: insertZScores

### ** Examples

  db <- initializeDb("", "My Dataset")
  zscores <- c(1, 2, 3)
  names(zscores) <- c("A", "B", "C")
  db <- insertZScores(db, zscores)
  closeDb(db)



