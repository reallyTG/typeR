library(git2r)


### Name: note_remove
### Title: Remove the note for an object
### Aliases: note_remove

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
##D 
##D ## Create note in default namespace
##D note_1 <- note_create(commit_1, "Note-1")
##D 
##D ## Create note in named (review) namespace
##D note_2 <- note_create(commit_1, "Note-2", ref="refs/notes/review")
##D 
##D ## List notes in default namespace
##D notes(repo)
##D 
##D ## List notes in 'review' namespace
##D notes(repo, "review")
##D 
##D ## Remove notes
##D note_remove(note_1)
##D note_remove(note_2)
##D 
##D ## List notes in default namespace
##D notes(repo)
##D 
##D ## List notes in 'review' namespace
##D notes(repo, "review")
## End(Not run)



