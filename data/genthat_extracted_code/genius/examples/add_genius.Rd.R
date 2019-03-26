library(genius)


### Name: add_genius
### Title: Add lyrics to a data frame
### Aliases: add_genius

### ** Examples

## No test: 
artist_albums <- tribble(
 ~artist, ~album,
 "J. Cole", "KOD",
 "Sampha", "Process"
)


artist_albums %>%
 add_genius(artist, album)

artist_songs <- tribble(
 ~artist, ~track,
 "J. Cole", "Motiv8",
 "Andrew Bird", "Anonanimal"
)

artist_songs %>%
 add_genius(artist, track, type = "lyrics")
## End(No test)




