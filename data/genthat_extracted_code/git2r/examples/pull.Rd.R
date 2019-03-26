library(git2r)


### Name: pull
### Title: Pull
### Aliases: pull

### ** Examples

## Not run: 
##D ## Initialize repositories
##D path_bare <- tempfile(pattern="git2r-")
##D path_repo_1 <- tempfile(pattern="git2r-")
##D path_repo_2 <- tempfile(pattern="git2r-")
##D dir.create(path_bare)
##D dir.create(path_repo_1)
##D dir.create(path_repo_2)
##D repo_bare <- init(path_bare, bare = TRUE)
##D repo_1 <- clone(path_bare, path_repo_1)
##D 
##D ## Config first user and commit a file
##D config(repo_1, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Write to a file and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "First commit message")
##D 
##D ## Push commits from first repository to bare repository
##D ## Adds an upstream tracking branch to branch 'master'
##D push(repo_1, "origin", "refs/heads/master")
##D 
##D ## Clone to second repository
##D repo_2 <- clone(path_bare, path_repo_2)
##D config(repo_2, user.name="Bob", user.email="bob@example.org")
##D 
##D ## Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "Second commit message")
##D 
##D ## Push commits from first repository to bare repository
##D push(repo_1)
##D 
##D ## Pull changes to repo_2
##D pull(repo_2)
##D 
##D ## Change file again and commit. This time in repository 2
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad",
##D              "minim veniam, quis nostrud exercitation ullamco laboris nisi ut"),
##D            file.path(path_repo_2, "example.txt"))
##D add(repo_2, "example.txt")
##D commit(repo_2, "Third commit message")
##D 
##D ## Push commits from second repository to bare repository
##D push(repo_2)
##D 
##D ## Pull changes to repo_1
##D pull(repo_1)
##D 
##D ## List commits in repositories
##D commits(repo_1)
##D commits(repo_2)
##D commits(repo_bare)
## End(Not run)



