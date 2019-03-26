library(myepisodes)


### Name: shows_from_myepisodes_feed
### Title: Create list of information for individual shows from MyEpisodes
###   feed
### Aliases: shows_from_myepisodes_feed

### ** Examples

## Not run: shows_from_myepisodes_feed(myepisodes_feed_url("user", "password"))
  mock_feed_url <- file.path(system.file(package = "myepisodes"), "test_data/mock_mylist.xml")
  shows_from_myepisodes_feed(mock_feed_url)



