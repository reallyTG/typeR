library(VBTree)


### Name: vbtsub
### Title: Using vector to generate sub tree from vector binary tree
### Aliases: vbtsub
### Keywords: Vector.Binary.Tree

### ** Examples

#Make vector binary tree:
colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))

#Generating sub tree by specific assignment:
vbtsub(colnamevbt, c(2, 3, 1, 1))

#Generating sub tree with traversal in the second layers:
vbtsub(colnamevbt, c(2, -1, 1, 1))

#Generating sub tree with invalid assignments in 1st and 3rd layers:
vbtsub(colnamevbt, c(4, 3, 7, 1))



