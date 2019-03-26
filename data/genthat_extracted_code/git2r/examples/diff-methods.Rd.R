library(git2r)


### Name: diff.git_repository
### Title: Changes between commits, trees, working tree, etc.
### Aliases: diff.git_repository diff.git_tree

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Config user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add, commit
##D writeLines("Hello world!", file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Commit message")
##D 
##D ## Change the file
##D writeLines(c("Hello again!", "Here is a second line", "And a third"),
##D            file.path(path, "test.txt"))
##D 
##D ## diff between index and workdir
##D diff_1 <- diff(repo)
##D summary(diff_1)
##D cat(diff(repo, as_char=TRUE))
##D 
##D ## Diff between index and HEAD is empty
##D diff_2 <- diff(repo, index=TRUE)
##D summary(diff_2)
##D cat(diff(repo, index=TRUE, as_char=TRUE))
##D 
##D ## Diff between tree and working dir, same as diff_1
##D diff_3 <- diff(tree(commits(repo)[[1]]))
##D summary(diff_3)
##D cat(diff(tree(commits(repo)[[1]]), as_char=TRUE))
##D 
##D ## Add changes, diff between index and HEAD is the same as diff_1
##D add(repo, "test.txt")
##D diff_4 <- diff(repo, index=TRUE)
##D summary(diff_4)
##D cat(diff(repo, index=TRUE, as_char=TRUE))
##D 
##D ## Diff between tree and index
##D diff_5 <- diff(tree(commits(repo)[[1]]), index=TRUE)
##D summary(diff_5)
##D cat(diff(tree(commits(repo)[[1]]), index=TRUE, as_char=TRUE))
##D 
##D ## Diff between two trees
##D commit(repo, "Second commit")
##D tree_1 <- tree(commits(repo)[[2]])
##D tree_2 <- tree(commits(repo)[[1]])
##D diff_6 <- diff(tree_1, tree_2)
##D summary(diff_6)
##D cat(diff(tree_1, tree_2, as_char=TRUE))
##D 
##D ## Binary files
##D set.seed(42)
##D writeBin(as.raw((sample(0:255, 1000, replace=TRUE))),
##D          con=file.path(path, "test.bin"))
##D add(repo, "test.bin")
##D diff_7 <- diff(repo, index=TRUE)
##D summary(diff_7)
##D cat(diff(repo, index=TRUE, as_char=TRUE))
## End(Not run)



