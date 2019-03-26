library(fs)


### Name: path_expand
### Title: Finding the User Home Directory
### Aliases: path_expand path_expand_r path_home path_home_r

### ** Examples

# Expand a path
path_expand("~/bin")

# You can use `path_home()` without arguments to see what is being used as
# the home diretory.
path_home()
path_home("R")

# This will likely differ from the above on Windows
path_home_r()



