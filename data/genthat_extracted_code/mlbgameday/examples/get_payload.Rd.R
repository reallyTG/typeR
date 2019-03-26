library(mlbgameday)


### Name: get_payload
### Title: Get Gameday data from MLBAM.
### Aliases: get_payload

### ** Examples


## Not run: 
##D # Make a request for a single day.
##D df <- get_payload(start = "2016-06-01", end = "2016-06-01")
##D 
##D 
##D # Run larger requests in parallel.
##D library(doParallel)
##D library(foreach)
##D 
##D no_cores <- detectCores() - 2
##D cl <- makeCluster(no_cores) 
##D registerDoParallel(cl)
##D 
##D df <- get_payload(start = "2016-01-01", end = "2017-01-01")
##D 
##D stopImplicitCluster()
##D rm(cl)
##D 
## End(Not run)

# Supply your own custom vector of game ids.

mygids <- search_gids(team = "indians", start = "2016-05-01", end = "2016-05-01")

df <- get_payload(game_ids = mygids)





