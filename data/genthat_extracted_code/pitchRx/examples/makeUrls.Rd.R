library(pitchRx)


### Name: makeUrls
### Title: Construct Gameday urls based on some parameters.
### Aliases: makeUrls

### ** Examples

# XML file names with pitch-by-pitch level data
prefix <- makeUrls(start="2011-04-04", end="2011-04-04")
paste0(prefix, "/inning/inning_all.xml")
# XML file names with hit location data
paste0(prefix, "/inning/inning_hit.xml")
# XML file names with game-by-game level data
paste0(makeUrls(start="2011-04-04", end="2011-04-04", gids=""), "/miniscoreboard.xml")
# Use gids option instead
data(gids)
identical(prefix, makeUrls(gids=gids[grep("2011_04_04", gids)]))



