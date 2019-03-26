library(gtools)


### Name: scat
### Title: Display debugging text
### Aliases: scat
### Keywords: print

### ** Examples

options(DEBUG=NULL) # makee sure DEBUG isn't set
scat("Not displayed")

options(DEBUG=TRUE)
scat("This will be displayed immediately (even in R BATCH output \n")
scat("files), provided options()$DEBUG is TRUE.")



