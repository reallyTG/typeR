library(gistr)


### Name: gist_create_git
### Title: Create a gist via git instead of the GitHub Gists HTTP API
### Aliases: gist_create_git

### ** Examples

## Not run: 
##D # prepare a directory and a file
##D unlink("~/gitgist", recursive = TRUE)
##D dir.create("~/gitgist")
##D file <- system.file("examples", "stuff.md", package = "gistr")
##D writeLines(readLines(file), con = "~/gitgist/stuff.md")
##D 
##D # create a gist
##D gist_create_git(files = "~/gitgist/stuff.md")
##D 
##D ## more than one file can be passed in
##D unlink("~/gitgist2", recursive = TRUE)
##D dir.create("~/gitgist2")
##D file.copy(file, "~/gitgist2/")
##D cat("hello world", file = "~/gitgist2/hello_world.md")
##D list.files("~/gitgist2")
##D gist_create_git(c("~/gitgist2/stuff.md", "~/gitgist2/hello_world.md"))
##D 
##D # Include all files in a directory
##D unlink("~/gitgist3", recursive = TRUE)
##D dir.create("~/gitgist3")
##D cat("foo bar", file="~/gitgist3/foobar.txt")
##D cat("hello", file="~/gitgist3/hello.txt")
##D list.files("~/gitgist3")
##D gist_create_git("~/gitgist3")
##D 
##D # binary files
##D png <- system.file("examples", "file.png", package = "gistr")
##D unlink("~/gitgist4", recursive = TRUE)
##D dir.create("~/gitgist4")
##D file.copy(png, "~/gitgist4/")
##D list.files("~/gitgist4")
##D gist_create_git(files = "~/gitgist4/file.png")
##D 
##D # knit files first, then push up
##D # note: by default we don't upload images, but you can do that, 
##D # see next example
##D rmd <- system.file("examples", "plots.Rmd", package = "gistr")
##D unlink("~/gitgist5", recursive = TRUE)
##D dir.create("~/gitgist5")
##D file.copy(rmd, "~/gitgist5/")
##D list.files("~/gitgist5")
##D gist_create_git("~/gitgist5/plots.Rmd", knit = TRUE)
##D 
##D # collect all/any artifacts from knitting process
##D arts <- system.file("examples", "artifacts_eg1.Rmd", package = "gistr")
##D unlink("~/gitgist6", recursive = TRUE)
##D dir.create("~/gitgist6")
##D file.copy(arts, "~/gitgist6/")
##D list.files("~/gitgist6")
##D gist_create_git("~/gitgist6/artifacts_eg1.Rmd", knit = TRUE, 
##D    artifacts = TRUE)
##D 
##D # from a code block
##D gist_create_git(code={'
##D x <- letters
##D numbers <- runif(8)
##D numbers
##D 
##D [1] 0.3229318 0.5933054 0.7778408 0.3898947 0.1309717 0.7501378 0.3206379 0.3379005
##D '}, filename="my_cool_code.R")
##D 
##D # Use https instead of ssh
##D png <- system.file("examples", "file.png", package = "gistr")
##D unlink("~/gitgist7", recursive = TRUE)
##D dir.create("~/gitgist7")
##D file.copy(png, "~/gitgist7/")
##D list.files("~/gitgist7")
##D gist_create_git(files = "~/gitgist7/file.png", git_method = "https")
## End(Not run)



