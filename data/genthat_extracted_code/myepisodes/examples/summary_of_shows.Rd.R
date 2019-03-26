library(myepisodes)


### Name: summary_of_shows
### Title: Display summary of all the tv episodes in a list
### Aliases: summary_of_shows

### ** Examples

mock_feed_url <- file.path(system.file(package = "myepisodes"), "test_data/mock_mylist.xml")
  mock_shows <- shows_from_myepisodes_feed(mock_feed_url)
  summary_of_shows(mock_shows)



