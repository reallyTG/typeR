library(VBTree)


### Name: vbt2ts
### Title: Convert a vector binary tree to tensor
### Aliases: vbt2ts
### Keywords: Vector.Binary.Tree tensor

### ** Examples

#Make column names of datatest into vector binary tree:
vbt <- dl2vbt(chrvec2dl(colnames(datatest), "-"))

#Convert the vector binary tree to a tensor:
vbt2ts(vbt)



