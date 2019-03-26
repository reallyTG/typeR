library(VBTree)


### Name: trvsidxinq
### Title: Using vector to visit the traversal table
### Aliases: trvsidxinq
### Keywords: Trav.Inq Trav.Table

### ** Examples

#Make traversal table:
trav <- trvs(dl2vbt(chrvec2dl(colnames(datatest))))

#Visit specific element by its coordinate:
trvsidxinq(trav,c(1,2,3,1))



