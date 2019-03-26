library(git2r)


### Name: when
### Title: When
### Aliases: when

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a first user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Create tag
##D tag(repo, "Tagname", "Tag message")
##D 
##D when(commits(repo)[[1]])
##D when(tags(repo)[[1]])
## End(Not run)



