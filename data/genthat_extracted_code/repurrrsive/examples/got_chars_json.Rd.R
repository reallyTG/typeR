library(repurrrsive)


### Name: got_chars_json
### Title: Paths to Game of Thrones data as JSON and XML
### Aliases: got_chars_json got_chars_xml

### ** Examples

got_chars_json()
if (require("jsonlite")) {
  gotcj <- fromJSON(got_chars_json(), simplifyDataFrame = FALSE)
  identical(got_chars, gotcj)
}
got_chars_xml()
if (require("xml2")) {
  xml <- read_xml(got_chars_xml())
  xml
}



