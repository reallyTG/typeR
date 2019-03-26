library(repurrrsive)


### Name: gh_repos
### Title: GitHub repos
### Aliases: gh_repos
### Keywords: datasets

### ** Examples

gh_repos
str(lapply(gh_repos[[1]][1:3], `[`, c("full_name", "created_at")))



