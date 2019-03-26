library(VBTree)


### Name: advbtinq
### Title: Using double list to visit vector binary tree
### Aliases: advbtinq
### Keywords: Double.List Vector.Binary.Tree

### ** Examples

#Make vector binary tree:
colnamevbt <- dl2vbt(chrvec2dl(colnames(datatest)))

#Visit by specific assignment:
visit <- list(c(2), c(3:6), c(2,4), 1)
advbtinq(colnamevbt, visit)

#Traversal of the second layers:
visit <- list(c(2), colnamevbt$dims[2]+1, c(2,4), 1)
advbtinq(colnamevbt, visit)

#Invalid assignments in 1st and 3rd layers:
visit <- list(c(3), c(3:6), c(5), 1)
advbtinq(colnamevbt, visit)



