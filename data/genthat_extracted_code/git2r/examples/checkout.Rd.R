library(git2r)


### Name: checkout
### Title: Checkout
### Aliases: checkout

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
##D push(repo_1, "origin", "refs/heads/master")
##D 
##D ## Create and checkout 'dev' branch in repo 1
##D checkout(repo_1, "dev", create = TRUE)
##D 
##D ## Add changes to 'dev' branch in repo 1 and push to bare
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            con = file.path(path_repo_1, "test.txt"))
##D add(repo_1, "test.txt")
##D commit(repo_1, "Second commit message")
##D push(repo_1, "origin", "refs/heads/dev")
##D 
##D ## Clone to repo 2
##D repo_2 <- clone(path_bare, path_repo_2)
##D config(repo_2, user.name="Bob", user.email="bob@example.org")
##D 
##D ## Read content of 'test.txt'
##D readLines(file.path(path_repo_2, "test.txt"))
##D 
##D ## Checkout dev branch
##D checkout(repo_2, "dev")
##D 
##D ## Read content of 'test.txt'
##D readLines(file.path(path_repo_2, "test.txt"))
##D 
##D ## Edit "test.txt" in repo_2
##D writeLines("Hello world!", con = file.path(path_repo_2, "test.txt"))
##D 
##D ## Check status
##D status(repo_2)
##D 
##D ## Checkout "test.txt"
##D checkout(repo_2, path = "test.txt")
##D 
##D ## Check status
##D status(repo_2)
## End(Not run)



