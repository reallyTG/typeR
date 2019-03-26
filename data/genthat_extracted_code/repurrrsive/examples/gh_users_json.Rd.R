library(repurrrsive)


### Name: gh_users_json
### Title: Paths to GitHub data as JSON and XML
### Aliases: gh_users_json gh_repos_json gh_users_xml gh_repos_xml

### ** Examples

gh_users_json()
if (require("jsonlite")) {
  ghuj <- fromJSON(gh_users_json(), simplifyDataFrame = FALSE)
  identical(gh_users, ghuj)
}
gh_repos_json()
if (require("jsonlite")) {
  ghrj <- fromJSON(gh_repos_json(), simplifyDataFrame = FALSE)
  identical(gh_repos, ghrj)
}
gh_users_xml()
if (require("xml2")) {
  xml <- read_xml(gh_users_xml())
  xml
}
gh_repos_xml()
if (require("xml2")) {
  xml <- read_xml(gh_repos_xml())
  xml
}



