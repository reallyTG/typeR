## ----setup, include=TRUE-------------------------------------------------

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  gids <- search_gids(start = "2016-01-01", end = "2017-01-01", game_type = "r")
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  gids <- search_gids(start = "2016-01-01", end = "2017-01-01", game_type = "r", venue = "Wrigley Field")
#  
#  # This also works with a "fuzzy search"
#  
#  gids <- search_gids(start = "2016-01-01", end = "2017-01-01", game_type = "r", venue = "Wrigley")
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  gids <- search_gids(team = "indians", start = "2015-01-01", end = "2015-01-01", game_type = "r")
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  # This workds.
#  
#  gids <- search_gids(team = "orioles", start = "2016-01-01", end = "2017-01-01", venue = "Oriole Park at Camden Yards")
#  
#  # This also works.
#  
#  gids <- search_gids(team = "orioles", start = "2016-01-01", end = "2017-01-01", venue = "Camden")
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  gids <- search_gids(team = "marlins", start = "2010-01-01", end = "2011-01-01", venue = "Marlins Park")
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  
#  gids <- search_gids(team = "marlins", start = "2010-01-01", end = "2011-01-01", venue = "Sun Life Stadium")
#  
#  # This will return the same result if we don't know the name of the stadium.
#  
#  gids <- search_gids(team = "marlins", start = "2010-01-01", end = "2011-01-01", home_only = TRUE, game_type = "r")
#  
#  

