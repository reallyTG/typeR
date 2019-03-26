library(mvc)


### Name: assignFinIdxPerClSkm
### Title: Assign final indices to means that have the smallest angle.
### Aliases: assignFinIdxPerClSkm

### ** Examples
## Not run: 
##D  
##D view1 = structure(c(1, 1, -1, 0, 1, 0, -1, -1), .Dim = c(4L, 2L))
##D view2 = structure(c(1, 1, -1, 0, 1, 0, -1, 0), .Dim = c(4L, 2L))
##D finIdx = assignFinIdxPerClSkm(view1,view2,mPerClV)
##D dput(finIdx) 
##D # c(2, 2, 1, 1)
## End(Not run)


