library(git2r)


### Name: note_create
### Title: Add note for a object
### Aliases: note_create

### ** Examples

## Not run: 
##D ## Create and initialize a repository in a temporary directory
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "Commit message 1")
##D 
##D ## Create another commit
##D writeLines(c("Hello world!",
##D              "HELLO WORLD!"),
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_2 <- commit(repo, "Commit message 2")
##D 
##D ## Check that notes is an empty list
##D notes(repo)
##D 
##D ## Create note in default namespace
##D note_create(commit_1, "Note-1")
##D 
##D ## Create note in named (review) namespace
##D note_create(commit_1, "Note-2", ref="refs/notes/review")
##D note_create(commit_2, "Note-3", ref="review")
##D 
##D ## Create note on blob and tree
##D note_create(tree(commit_1), "Note-4")
##D note_create(tree(commit_1)["example.txt"], "Note-5")
## End(Not run)



