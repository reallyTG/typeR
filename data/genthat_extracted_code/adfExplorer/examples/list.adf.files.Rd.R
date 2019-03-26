library(adfExplorer)


### Name: list.adf.files
### Title: List files in an amigaDisk directory
### Aliases: list.adf.files list.adf.files,amigaDisk,missing-method
###   list.adf.files,amigaDisk,character-method

### ** Examples

data(adf.example)

## show all files in the root of the example
## disk file:
list.adf.files(adf.example)

## you can also list the files in a specified
## directory:
list.adf.files(adf.example, "DF0:mods")

## For the same path, only now specified
## relatively to the current directory:
list.adf.files(adf.example, "mods")




