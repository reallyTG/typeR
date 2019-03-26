library(yum)


### Name: extract_yaml_dir
### Title: Extract all YAML fragments from all files in a directory
### Aliases: extract_yaml_dir

### ** Examples

### First get the directory where 'yum' is installed
yumDir <- system.file(package="yum");
### Specify the path of some example files
examplePath <- file.path(yumDir, "extdata");
### Show files (should be three .dct files)
list.files(examplePath);
### Load these files
yum::extract_yaml_dir(path=examplePath);



