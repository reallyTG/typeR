library(gh)


### Name: gh
### Title: GitHub API
### Aliases: gh gh-package gh

### ** Examples

## Not run: 
##D ## Repositories of a user, these are equivalent
##D gh("/users/hadley/repos")
##D gh("/users/:username/repos", username = "hadley")
##D 
##D ## Starred repositories of a user
##D gh("/users/hadley/starred")
##D gh("/users/:username/starred", username = "hadley")
##D 
##D ## Create a repository, needs a token in GITHUB_PAT (or GITHUB_TOKEN)
##D ## environment variable
##D gh("POST /user/repos", name = "foobar")
##D 
##D ## Issues of a repository
##D gh("/repos/hadley/dplyr/issues")
##D gh("/repos/:owner/:repo/issues", owner = "hadley", repo = "dplyr")
##D 
##D ## Automatic pagination
##D users <- gh("/users", .limit = 50)
##D length(users)
##D 
##D ## Access developer preview of Licenses API (in preview as of 2015-09-24)
##D gh("/licenses") # error code 415
##D gh("/licenses",
##D    .send_headers = c("Accept" = "application/vnd.github.drax-preview+json"))
##D 
##D ## Access Github Enterprise API
##D gh("/user/repos", type = "public", .api_url = "https://github.foobar.edu/api/v3")
##D 
##D ## Use I() to force body part to be sent as an array, even if length 1
##D ## This works whether assignees has length 1 or > 1
##D assignees <- "gh_user"
##D assignees <- c("gh_user1", "gh_user2")
##D gh("PATCH /repos/OWNER/REPO/issues/1", assignees = I(assignees))
## End(Not run)




