library(mlbgameday)


### Name: search_gids
### Title: Search the internal game_id data set.
### Aliases: search_gids

### ** Examples


# Collect all of the regular season games for the 2016 Cleveland Indians.
game_ids <- search_gids(team = "indians", start = "2016-01-01", end = "2016-12-31", game_type = "r")
head(game_ids)

## Not run: 
##D # Collect all games from the 2016 World Series
##D game_ids <- search_gids(start = "2016-10-25", end = "2016-11-02", game_type = "w")
##D 
##D # Collect all regular season games played at Wrigley Field since 2008.
##D game_ids <- search_gids(venue = "Wrigley Field")
##D 
##D # Fuzzy search results work too.
##D game_ids <- search_gids(venue = "Wrigley")
##D 
## End(Not run)



