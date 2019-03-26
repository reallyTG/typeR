library(sfsmisc)


### Name: sourceAttach
### Title: Source and Attach an R source file
### Aliases: sourceAttach
### Keywords: file utilities

### ** Examples

 sourceAttach(system.file("test-tools-1.R", package="Matrix", mustWork=TRUE))
 search() # shows the new "data base" at position 2
 ## look what it contains:
 ls.str(pos = 2)



