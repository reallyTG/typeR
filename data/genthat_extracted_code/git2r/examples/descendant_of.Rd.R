library(git2r)


### Name: descendant_of
### Title: Descendant
### Aliases: descendant_of

### ** Examples

## Not run: 
##D ## Create a directory in tempdir
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D 
##D ## Initialize a repository
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit_1 <- commit(repo, "Commit message 1")
##D 
##D # Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D              con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit_2 <- commit(repo, "Commit message 2")
##D 
##D descendant_of(commit_1, commit_2)
##D descendant_of(commit_2, commit_1)
## End(Not run)



