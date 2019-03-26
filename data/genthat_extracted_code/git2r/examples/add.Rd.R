library(git2r)


### Name: add
### Title: Add file(s) to index
### Aliases: add

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file
##D writeLines("a", file.path(path, "a.txt"))
##D 
##D ## Add file to repository and view status
##D add(repo, "a.txt")
##D status(repo)
##D 
##D ## Add file with a leading './' when the repository working
##D ## directory is the current working directory
##D setwd(path)
##D writeLines("b", file.path(path, "b.txt"))
##D add(repo, "./b.txt")
##D status(repo)
##D 
##D ## Add a file in a sub-folder with sub-folder as the working
##D ## directory. Create a file in the root of the repository
##D ## working directory that will remain untracked.
##D dir.create(file.path(path, "sub_dir"))
##D setwd("./sub_dir")
##D writeLines("c", file.path(path, "c.txt"))
##D writeLines("c", file.path(path, "sub_dir/c.txt"))
##D add(repo, "c.txt")
##D status(repo)
##D 
##D ## Add files with glob expansion when the current working
##D ## directory is outside the repository's working directory.
##D setwd(tempdir())
##D dir.create(file.path(path, "glob_dir"))
##D writeLines("d", file.path(path, "glob_dir/d.txt"))
##D writeLines("e", file.path(path, "glob_dir/e.txt"))
##D writeLines("f", file.path(path, "glob_dir/f.txt"))
##D writeLines("g", file.path(path, "glob_dir/g.md"))
##D add(repo, "glob_dir/*txt")
##D status(repo)
##D 
##D ## Add file with glob expansion with a relative path when
##D ## the current working directory is inside the repository's
##D ## working directory.
##D setwd(path)
##D add(repo, "./glob_dir/*md")
##D status(repo)
## End(Not run)



