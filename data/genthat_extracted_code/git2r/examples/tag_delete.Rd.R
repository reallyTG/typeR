library(git2r)


### Name: tag_delete
### Title: Delete an existing tag reference
### Aliases: tag_delete

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Commit a text file
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Create two tags
##D tag(repo, "Tag1", "Tag message 1")
##D t2 <- tag(repo, "Tag2", "Tag message 2")
##D 
##D ## List the two tags in the repository
##D tags(repo)
##D 
##D ## Delete the two tags in the repository
##D tag_delete(repo, "Tag1")
##D tag_delete(t2)
##D 
##D ## Show the empty list with tags in the repository
##D tags(repo)
## End(Not run)



