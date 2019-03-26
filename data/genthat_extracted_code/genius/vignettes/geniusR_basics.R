## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
# Load needed libraries
library(genius)
library(dplyr)

## ------------------------------------------------------------------------
DNA <- genius_lyrics(artist = "Kendrick Lamar", song = "DNA.")
DNA


## ------------------------------------------------------------------------
genius_lyrics(artist = "Kendrick Lamar", song = "DNA.", info = "features")

## ------------------------------------------------------------------------
DAMN <- genius_album(artist = "Kendrick Lamar", album = "DAMN.")

head(DAMN)

## ------------------------------------------------------------------------
# Example with 2 different artists and albums
artist_albums <- tribble(
 ~artist, ~album,
 "J. Cole", "KOD",
 "Sampha", "Process"
)


artist_albums %>%
 add_genius(artist, album)


# Example with 2 different artists and songs
artist_songs <- tribble(
 ~artist, ~track,
 "J. Cole", "Motiv8",
 "Andrew Bird", "Anonanimal"
)

artist_songs %>%
 add_genius(artist, track, type = "lyrics")

## ------------------------------------------------------------------------
damn_tracks <- genius_tracklist(artist = "Kendrick Lamar", album = "DAMN.")

# Collector's reverse order
damn_tracks %>% 
  arrange(-track_n)

