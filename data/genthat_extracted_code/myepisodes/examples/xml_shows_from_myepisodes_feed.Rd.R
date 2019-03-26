library(myepisodes)


### Name: xml_shows_from_myepisodes_feed
### Title: Get shows from given MyEpisode feeds (retaining individual XML
###   structure)
### Aliases: xml_shows_from_myepisodes_feed

### ** Examples

## Not run: xml_shows_from_myepisodes_feed(myepisodes_feed_url("user", "password"))
  mock_feed_url <- file.path(system.file(package = "myepisodes"), "test_data/mock_mylist.xml")
  xml_shows_from_myepisodes_feed(mock_feed_url)



