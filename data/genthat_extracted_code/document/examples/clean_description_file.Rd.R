library(document)


### Name: clean_description_file
### Title: Make a Default DESCRIPTION File Pass 'R CMD check'
### Aliases: clean_description_file
### Keywords: internal

### ** Examples

if (! exists("dummy")) assign("dummy", "dumb")
utils::package.skeleton(path = tempdir())
old <- readLines(file.path(tempdir(), "anRpackage", "DESCRIPTION"))
document:::clean_description_file(path = file.path(tempdir(), "anRpackage", 
                                        "DESCRIPTION"))
new <- readLines(file.path(tempdir(), "anRpackage", "DESCRIPTION"))
setdiff(new, old)



