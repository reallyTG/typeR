library(yum)


### Name: load_yaml_dir
### Title: Load all YAML fragments from all files in a directory
### Aliases: load_yaml_dir

### ** Examples

### First get the directory where 'yum' is installed
yumDir <- system.file(package="yum");
### Specify the path of some example files
examplePath <- file.path(yumDir, "extdata");
### Show files (should be three .dct files)
list.files(examplePath);
### Load these files
yum::load_yaml_dir(path=examplePath);



