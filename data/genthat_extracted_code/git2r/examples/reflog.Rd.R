library(git2r)


### Name: reflog
### Title: List and view reflog information
### Aliases: reflog

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Config user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Write to a file and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Second commit message")
##D 
##D ## Change file again and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
##D              "minim veniam, quis nostrud exercitation ullamco laboris nisi ut"),
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Third commit message")
##D 
##D ## View reflog
##D reflog(repo)
## End(Not run)



