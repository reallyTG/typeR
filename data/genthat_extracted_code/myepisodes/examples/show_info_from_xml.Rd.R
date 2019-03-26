library(myepisodes)


### Name: show_info_from_xml
### Title: Get tv episode information from XML
### Aliases: show_info_from_xml

### ** Examples

mock_feed_url <- file.path(system.file(package = "myepisodes"), "test_data/mock_mylist.xml")
  xml_shows <- xml_shows_from_myepisodes_feed(mock_feed_url)
  show_info_from_xml(xml_shows[[1]])



