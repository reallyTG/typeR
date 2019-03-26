library(git2r)


### Name: is_binary
### Title: Is blob binary
### Aliases: is_binary

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
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## Check if binary
##D b_text <- tree(commit_1)["example.txt"]
##D is_binary(b_text)
##D 
##D ## Commit plot file (binary)
##D x <- 1:100
##D y <- x^2
##D png(file.path(path, "plot.png"))
##D plot(y ~ x, type = "l")
##D dev.off()
##D add(repo, "plot.png")
##D commit_2 <- commit(repo, "Second commit message")
##D 
##D ## Check if binary
##D b_png <- tree(commit_2)["plot.png"]
##D is_binary(b_png)
## End(Not run)



