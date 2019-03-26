library(workflowr)


### Name: wflow_git_remote
### Title: Manage remote Git repositories
### Aliases: wflow_git_remote

### ** Examples

## Not run: 
##D # Display the current remotes
##D wflow_git_remote()
##D # Add a remote called origin that points to the
##D # GitHub repository example_repo owned by
##D # the GitHub user example_user
##D wflow_git_remote("origin", "example_user", "example_repo")
##D # Remove the remote named upstream
##D wflow_git_remote("upstream", action = "remove")
##D # Change the protocol of the remote origin from https to ssh
##D wflow_git_remote("origin", "example_user", "example_repo", protocol = "ssh",
##D               action = "set_url")
## End(Not run)



