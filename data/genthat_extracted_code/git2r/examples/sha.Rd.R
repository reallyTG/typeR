library(git2r)


### Name: sha
### Title: Get the SHA-1 of a git object
### Aliases: sha sha.git_blob sha.git_branch sha.git_commit sha.git_note
###   sha.git_reflog_entry sha.git_tag sha.git_tree sha.git_fetch_head
###   sha.git_merge_result

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
##D ## Get the SHA-1 of the last commit
##D sha(last_commit(repo))
## End(Not run)



