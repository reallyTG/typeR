## ----setup, include=TRUE-------------------------------------------------

## ---- eval=F-------------------------------------------------------------
#  library(mlbgameday)
#  library(RSQLite)
#  library(DBI)
#  
#  # Create SQLite database.
#  
#  con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "gameday.sqlite3")
#  

## ---- eval=F-------------------------------------------------------------
#  
#  # Create a list of game_ids for the 2016 World Series.
#  
#  game_ids <- search_gids(start = "2016-10-01", end = "2016-12-01", game_type = "w")
#  
#  # Gather data and write to database.
#  
#  get_payload(game_ids = game_ids, dataset = "inning_all", db_con = con)
#  
#  # Re-connect to database since the get_payload() function closed the connection.
#  
#  con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "gameday.sqlite3")
#  
#  # Take a look at our tables.
#  
#  dbListTables(con)
#  

## ---- eval=F-------------------------------------------------------------
#  
#  # Bring data from database into memory via standard SQL.
#  # Query a data frame of all pitches thrown by Andrew Miller in the 2016 World Series.
#  
#  millerTime <- dbGetQuery(con,
#                  "SELECT * FROM pitch p
#                  LEFT JOIN atbat a ON a.num = p.num
#                  AND a.url = p.url
#                  WHERE a.pitcher_name = 'Andrew Miller'")
#  

## ---- eval=F-------------------------------------------------------------
#  library(dbplyr)
#  library(dplyr)
#  
#  atbat <- tbl(con, "atbat")
#  pitch <- tbl(con, "pitch")
#  
#  # Notice pitch and atbat are not data frames, rather they are database connections.
#  
#  summary(atbat)
#  
#  query <- pitch %>% left_join(atbat, by = c("num", "url")) %>%
#      filter(batter_name == "Kyle Schwarber")
#  

## ---- eval=F-------------------------------------------------------------
#  
#  # Construct a query using dplyr verbs. Notice here that the "query" still hasn't loaded any data.
#  
#  query <- pitch %>% left_join(atbat, by = c("num", "url")) %>%
#      filter(batter_name == "Kyle Schwarber")
#  
#  # Once we have the subset we want, we can pull that into the R enviornment as a data frame.
#  
#  schwarber <- collect(query)
#  

