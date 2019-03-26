library(repurrrsive)


### Name: wesanderson_json
### Title: Path to wesanderson JSON and XML
### Aliases: wesanderson_json wesanderson_xml

### ** Examples

wesanderson_json()
if (require("jsonlite")) {
  jsonlite::fromJSON(wesanderson_json())
}
wesanderson_xml()
if (require("xml2")) {
  xml2::read_xml(wesanderson_xml())
}



