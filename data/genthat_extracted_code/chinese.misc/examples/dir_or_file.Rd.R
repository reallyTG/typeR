library(chinese.misc)


### Name: dir_or_file
### Title: Collect Full Filenames from a Mix of Directories and Files
### Aliases: dir_or_file

### ** Examples

x1 <- find.package("base")
x2 <- find.package("utils")
all_file <- dir_or_file(x1, x2, special = "rds$")



