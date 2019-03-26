library(spotifyr)


### Name: get_track_audio_features
### Title: Get audio features from one or more tracks on Spotify
### Aliases: get_track_audio_features
### Keywords: audio features track

### ** Examples

## Not run: 
##D ##### Get tracks for all of Radiohead's albums
##D artists <- get_artists('radiohead')
##D albums <- get_albums(artists$artist_uri[1])
##D tracks <- get_album_tracks(albums)
##D radiohead_audio_features <- get_track_audio_features(tracks)
##D 
##D ##### Get tracks for all of Barack Obama's playlists
##D playlists <- get_user_playlists('barackobama')
##D tracks <- get_playlist_tracks(playlists)
##D obama_audio_features <- get_track_audio_features(tracks)
## End(Not run)



