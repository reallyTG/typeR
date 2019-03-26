library(git2r)


### Name: branch_rename
### Title: Rename a branch
### Aliases: branch_rename

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Config user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Rename 'master' branch to 'dev'
##D branches(repo)
##D branch_rename(repository_head(repo), "dev")
##D branches(repo)
## End(Not run)



