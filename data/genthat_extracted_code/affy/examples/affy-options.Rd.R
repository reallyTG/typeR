library(affy)


### Name: affy-options
### Title: Options for the affy package
### Aliases: affy-options
### Keywords: manip

### ** Examples

## get the options
opt <- getOption("BioC")
affy.opt <- opt$affy

## list their names
names(affy.opt)

## set the option compress.cel
affy.opt$compress.cel <- TRUE
options(BioC=opt)



