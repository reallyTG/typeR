library(VBTree)


### Name: vbtinq
### Title: Using vector to visit vector binary tree
### Aliases: vbtinq
### Keywords: Double.List Vector.Binary.Tree

### ** Examples

#Make vector binary tree:
colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))

#Visit by specific assignment:
vbtinq(colnamevbt, c(2, 3, 1, 1))

#Traversal of the second layers:
vbtinq(colnamevbt, c(2, -1, 1, 1))

#Invalid assignments in 1st and 3rd layers:
vbtinq(colnamevbt, c(4, 3, 7, 1))



