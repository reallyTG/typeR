library(git2r)


### Name: contributions
### Title: Contributions
### Aliases: contributions

### ** Examples

## Not run: 
##D ## Create directories and initialize repositories
##D path_bare <- tempfile(pattern="git2r-")
##D path_repo_1 <- tempfile(pattern="git2r-")
##D path_repo_2 <- tempfile(pattern="git2r-")
##D dir.create(path_bare)
##D dir.create(path_repo_1)
##D dir.create(path_repo_2)
##D repo_bare <- init(path_bare, bare = TRUE)
##D 
##D ## Clone to repo 1 and config user
##D repo_1 <- clone(path_bare, path_repo_1)
##D config(repo_1, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Add changes to repo 1 and push to bare
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            con = file.path(path_repo_1, "test.txt"))
##D add(repo_1, "test.txt")
##D commit(repo_1, "First commit message")
##D 
##D ## Add more changes to repo 1
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            con = file.path(path_repo_1, "test.txt"))
##D add(repo_1, "test.txt")
##D commit(repo_1, "Second commit message")
##D 
##D ## Push to bare
##D push(repo_1, "origin", "refs/heads/master")
##D 
##D ## Clone to repo 2
##D repo_2 <- clone(path_bare, path_repo_2)
##D config(repo_2, user.name="Bob", user.email="bob@example.org")
##D 
##D ## Add changes to repo 2
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
##D              "minim veniam, quis nostrud exercitation ullamco laboris nisi ut"),
##D            con = file.path(path_repo_2, "test.txt"))
##D add(repo_2, "test.txt")
##D commit(repo_2, "Third commit message")
##D 
##D ## Push to bare
##D push(repo_2, "origin", "refs/heads/master")
##D 
##D ## Pull changes to repo 1
##D pull(repo_1)
##D 
##D ## View contributions by day
##D contributions(repo_1)
##D 
##D ## View contributions by author and day
##D contributions(repo_1, by = "author")
## End(Not run)



