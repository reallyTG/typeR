library(spotifyr)


### Name: parse_playlist_list_to_df
### Title: Parse Spotify playlist list to a dataframe
### Aliases: parse_playlist_list_to_df
### Keywords: username

### ** Examples

## Not run: 
##D username <- 'barackobama'
##D playlist_count <- get_user_playlist_count(username)
##D num_loops <- ceiling(playlist_count / 50)
##D offset <- 0
##D 
##D pb <- txtProgressBar(min = 0, max = num_loops, style = 3)
##D 
##D playlist_list <- map(1:ceiling(num_loops), function(this_loop) {
##D     endpoint <- paste0('https://api.spotify.com/v1/users/', username, '/playlists')
##D     res <- GET(endpoint, query = list(access_token = get_spotify_access_token(),
##D                                       offset = offset,
##D                                       limit = 50)) %>% content
##D 
##D     if (!is.null(res$error)) {
##D         stop(paste0(res$error$message, ' (', res$error$status, ')'))
##D     }
##D 
##D     content <- res$items
##D 
##D     total <- content$total
##D     offset <<- offset + 50
##D     setTxtProgressBar(pb, this_loop)
##D     return(content)
##D })
##D 
##D playlist_df <- parse_playlist_list_to_df(playlist_list)
## End(Not run)



