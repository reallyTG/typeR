## ---- eval=FALSE---------------------------------------------------------
#  library(baseballDBR)
#  library(RPostgreSQL)
#  library(dplyr)
#  
#  get_bbdb(AllTables = TRUE)
#  
#  # Make a list of all data frames.
#  dbTables <- names(Filter(isTRUE, eapply(.GlobalEnv, is.data.frame)))
#  
#  # Load data base drivers and load all data frames in a loop.
#  drv <- dbDriver("PostgreSQL")
#  con <- dbConnect(drv, host= "localhost", dbname= "lahman", user= "YOUR_USERNAME", password = "YOUR_PASSWORD")
#  
#  # Do some transformations on our selected dataframes.
#  Batting <- mutate(Batting, BA = BA(Batting), PA = PA(Batting), OBP = OBP(Batting), OPS = OPS(Batting))
#  
#  # Create a loop to write all of our data frames our Postgres instance.
#  for (i in 1:length(dbTables)) {
#      if (dbExistsTable(con, dbTables[i])) {
#         dbRemoveTable(con, dbTables[i])
#      }
#      dbWriteTable(con, name =  dbTables[i], value = get0(dbTables[i]), row.names = FALSE)
#  }
#  
#  # Make sure every thing wrote correctly.
#  test <- dbGetQuery(con, "SELECT * FROM Batting LIMIT 5")
#  test
#  rm(test)
#  
#  # Close the database connection.
#  dbDisconnect(con)
#  dbUnloadDriver(drv)

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  library(baseballDBR)
#  
#  # Use an "src" connection to access the database. This requires the same arguments that RPostreSQL uses to connect to the database.
#  # Note: There are also src functions for connecting to various types of databases.
#  pgcon <- src_postgres(host= "localhost", dbname= "lahman", user= "YOUR_USERNAME", password = "YOUR_PASSWORD")
#  
#  # We're not laoding the batting table, rather we're loading a method to access it.
#  Batting_tbl <- tbl(pgcon, "Batting")
#  
#  # Use familiar dplyr verbs to access our data.
#  Batting_tbl %>% select(playerID, yearID, H, AB) %>% filter(yearID >= 1900)
#  
#  # We can pull our data into R to permorm some modifications.
#  Batting <- collect(Batting_tbl, n = Inf) %>% mutate(BABIP = BABIP(Batting))
#  
#  # Write the modified table back to the database.
#  db_insert_into( con = pgcon$con, table = "Batting", values = Batting)
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(RPostgreSQL)
#  library(baseballDBR)
#  
#  # Load data base drivers and load all data frames in a loop.
#  drv <- dbDriver("PostgreSQL")
#  con <- dbConnect(drv, host= "localhost", dbname= "lahman", user= "YOUR_USERNAME", password = "YOUR_PASSWORD")
#  
#  # Load the Batting table into R.
#  Batting <- dbGetQuery(con, "SELECT * FROM Batting")
#  
#  # Permorm some modifications.
#  Batting <- mutate(BABIP = BABIP(Batting))
#  
#  # Write modified table back to the database.
#  dbWriteTable("Batting", Batting)
#  
#  # Close the database connection.
#  dbDisconnect(con)
#  dbUnloadDriver(drv)
#  

