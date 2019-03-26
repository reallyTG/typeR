library(adfExplorer)


### Name: amigaBlock-method
### Title: Extract block from or replace a block on an amigaDisk object
### Aliases: amigaBlock-method amigaBlock,amigaDisk,numeric-method
###   amigaBlock<- amigaBlock<-,amigaDisk,numeric,amigaBlock-method

### ** Examples

## get the root block from the example adf:
amigaBlock(adf.example, 880)

## Create a completely blank disk without file system:
blank.disk <- new("amigaDisk")

## Replace the boot block on the blank disk with
## that from the example object:
amigaBlock(blank.disk, 0) <- amigaBlock(adf.example, 0)

## The blank disk now has a boot block,
## but still no file system...



