library(rprojroot)


### Name: root_criterion
### Title: Is a directory the project root?
### Aliases: root_criterion is.root_criterion as.root_criterion
###   as.root_criterion.character as.root_criterion.root_criterion
###   |.root_criterion has_file has_dir has_file_pattern has_dirname

### ** Examples

root_criterion(function(path) file.exists(file.path(path, "somefile")), "has somefile")
has_file("DESCRIPTION")
is_r_package
is_r_package$find_file
## Not run: 
##D is_r_package$make_fix_file(".")
## End(Not run)



