library(fs)


### Name: path_file
### Title: Manipulate file paths
### Aliases: path_file path_dir path_ext path_ext_remove path_ext_set
###   path_ext<-

### ** Examples

path_file("dir/file.zip")

path_dir("dir/file.zip")

path_ext("dir/file.zip")

path_ext("file.tar.gz")

path_ext_remove("file.tar.gz")

# Only one level of extension is removed
path_ext_set(path_ext_remove("file.tar.gz"), "zip")



