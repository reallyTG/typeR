library(adfExplorer)


### Name: current.adf.dir
### Title: Get or set the current directory of an amigaDisk object
### Aliases: current.adf.dir current.adf.dir,amigaDisk-method
###   current.adf.dir<- current.adf.dir<-,amigaDisk,character-method

### ** Examples

data(adf.example)

## by default the current dir is the
## disk's root. The disk name is
## therefore shown when running
## current.adf.dir for the provided
## example data:

current.adf.dir(adf.example)

## change the current dir:
current.adf.dir(adf.example) <- "DF0:this/is/a/deep/path"

## confirm that it has changed:
current.adf.dir(adf.example)

## let's set it back to the disk's root:
current.adf.dir(adf.example) <- "DF0:"



