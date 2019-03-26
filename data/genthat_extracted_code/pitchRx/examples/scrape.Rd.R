library(pitchRx)


### Name: scrape
### Title: Scrape Major League Baseball's Gameday Data
### Aliases: scrape

### ** Examples

## Not run: 
##D # Collect PITCHf/x (and other data from inning_all.xml files) from
##D # all games played on August 1st, 2013 (using asynchronous downloads)
##D dat <- scrape(start = "2013-08-01", end = "2013-08-01")
##D #As of XML2R 0.0.5, asyncronous downloads can be performed
##D dat <- scrape(start = "2013-08-01", end = "2013-08-01", async = TRUE)
##D 
##D # Scrape PITCHf/x from Minnesota Twins 2011 season
##D data(gids, package = "pitchRx")
##D twins11 <- gids[grepl("min", gids) & grepl("2011", gids)]
##D dat <- scrape(game.ids = twins11[1]) #scrapes 1st game only
##D 
##D data(nonMLBgids, package = "pitchRx")
##D # Grab IDs for triple A games on June 1st, 2011
##D # This post explains more about obtaining game IDs with regular expressions --
##D # http://baseballwithr.wordpress.com/2014/06/30/pitchrx-meet-openwar-4/
##D aaa <- nonMLBgids[grepl("2011_06_01_[a-z]{3}aaa_[a-z]{3}aaa", nonMLBgids)]
##D dat <- scrape(game.ids = aaa)
##D 
##D # Create SQLite database, then collect and store data in that database
##D library(dplyr)
##D my_db <- src_sqlite("Gameday.sqlite3")
##D scrape(start = "2013-08-01", end = "2013-08-01", connect = my_db$con)
##D 
##D # Collect other data complementary to PITCHf/x and store in database
##D files <- c("inning/inning_hit.xml", "miniscoreboard.xml", "players.xml")
##D scrape(start = "2013-08-01", end = "2013-08-01", connect=my_db$con, suffix = files)
##D 
##D # Simple example to demonstrate database query using dplyr
##D # Note that 'num' and 'gameday_link' together make a key that allows us to join these tables
##D locations <- select(tbl(my_db, "pitch"), px, pz, des, num, gameday_link)
##D names <- select(tbl(my_db, "atbat"), pitcher_name, batter_name, num, gameday_link)
##D que <- inner_join(locations, filter(names, batter_name == "Paul Goldschmidt"),
##D                    by = c("num", "gameday_link"))
##D que$query #refine sql query if you'd like
##D pitchfx <- collect(que) #submit query and bring data into R
##D 
## End(Not run)



