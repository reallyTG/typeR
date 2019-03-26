library(remotes)


### Name: parse-git-repo
### Title: Parse a remote git repo specification
### Aliases: parse-git-repo parse_repo_spec parse_github_repo_spec
###   parse_github_url

### ** Examples

parse_repo_spec("metacran/crandb")
parse_repo_spec("jimhester/covr#47")        ## pull request
parse_repo_spec("jeroen/curl@v0.9.3")       ## specific tag
parse_repo_spec("tidyverse/dplyr@*release") ## shorthand for latest release
parse_repo_spec("r-lib/remotes@550a3c7d3f9e1493a2ba") ## commit SHA
parse_repo_spec("r-lib/remotes@550a3c7d3f9e1493a2ba") ## commit SHA
parse_repo_spec("igraph=igraph/rigraph") ## Different package name from repo name

parse_github_url("https://github.com/jeroen/curl.git")
parse_github_url("git@github.com:metacran/crandb.git")
parse_github_url("https://github.com/jimhester/covr")
parse_github_url("https://github.example.com/user/repo.git")
parse_github_url("git@github.example.com:user/repo.git")

parse_github_url("https://github.com/r-lib/remotes/pull/108")
parse_github_url("https://github.com/r-lib/remotes/tree/name-of-branch")
parse_github_url("https://github.com/r-lib/remotes/commit/1234567")
parse_github_url("https://github.com/r-lib/remotes/releases/latest")
parse_github_url("https://github.com/r-lib/remotes/releases/tag/1.0.0")



