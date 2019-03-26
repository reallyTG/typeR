library(VBTree)


### Name: trvseleinq
### Title: Using character element to visit the traversal table
### Aliases: trvseleinq
### Keywords: Trav.Inq Trav.Table

### ** Examples

#Make traversal table:
trav <- trvs(dl2vbt(chrvec2dl(colnames(datatest))))

#Visit specific element by character pattern:
trvseleinq(trav,"Strain-1100-0.001-0.6")



