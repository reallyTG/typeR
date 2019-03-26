library(git2r)


### Name: is_shallow
### Title: Determine if the repository is a shallow clone
### Aliases: is_shallow

### ** Examples

## Not run: 
##D ## Initialize repository
##D path_repo_1 <- tempfile(pattern="git2r-")
##D path_repo_2 <- tempfile(pattern="git2r-")
##D dir.create(path_repo_1)
##D dir.create(path_repo_2)
##D repo_1 <- init(path_repo_1)
##D 
##D ## Config user and commit a file
##D config(repo_1, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Write to a file and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "First commit message")
##D 
##D ## Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "Second commit message")
##D 
##D ## Change file again and commit.
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
##D              "minim veniam, quis nostrud exercitation ullamco laboris nisi ut"),
##D            file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "Third commit message")
##D 
##D ## Clone to second repository
##D repo_2 <- clone(path_repo_1, path_repo_2)
##D 
##D ## Check if it's a shallow clone
##D is_shallow(repo_2)
## End(Not run)



