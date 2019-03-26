library(RJDemetra)


### Name: count
### Title: Count the number of objects inside a workspace or
###   multiprocessing
### Aliases: count

### ** Examples

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
count(wk) # 1 multiprocessing inside the workspace wk
count(mp) # 0 sa_item inside the multiprocessing mp





