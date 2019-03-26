library(git2r)


### Name: repository
### Title: Open a repository
### Aliases: repository

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D # Configure a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Hello world!", file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D commit_1 <- commit(repo, "Commit message")
##D 
##D ## Make one more commit
##D writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D commit(repo, "Next commit message")
##D 
##D ## Create one more file
##D writeLines("Hello world!", file.path(path, "test-2.txt"))
##D 
##D ## Brief summary of repository
##D repo
##D 
##D ## Summary of repository
##D summary(repo)
##D 
##D ## Workdir of repository
##D workdir(repo)
##D 
##D ## Check if repository is bare
##D is_bare(repo)
##D 
##D ## Check if repository is empty
##D is_empty(repo)
##D 
##D ## Check if repository is a shallow clone
##D is_shallow(repo)
##D 
##D ## List all references in repository
##D references(repo)
##D 
##D ## List all branches in repository
##D branches(repo)
##D 
##D ## Get HEAD of repository
##D repository_head(repo)
##D 
##D ## Check if HEAD is head
##D is_head(repository_head(repo))
##D 
##D ## Check if HEAD is local
##D is_local(repository_head(repo))
##D 
##D ## List all tags in repository
##D tags(repo)
## End(Not run)



