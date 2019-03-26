library(git2r)


### Name: odb_blobs
### Title: Blobs in the object database
### Aliases: odb_blobs

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
##D commit(repo, "Commit message 1")
##D 
##D ## Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D              con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Commit message 2")
##D 
##D ## Commit same content under different name in a sub-directory
##D dir.create(file.path(path, "sub-directory"))
##D file.copy(file.path(path, "test.txt"), file.path(path, "sub-directory", "copy.txt"))
##D add(repo, "sub-directory/copy.txt")
##D commit(repo, "Commit message 3")
##D 
##D ## List blobs
##D odb_blobs(repo)
## End(Not run)



