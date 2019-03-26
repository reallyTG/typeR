library(VBTree)


### Name: ts2vbt
### Title: Convert a structured character tensor to double list
### Aliases: ts2vbt
### Keywords: Vector.Binary.Tree tensor

### ** Examples

#Write the column names of datatest into a tensor:
ts <- dl2ts(chrvec2dl(colnames(datatest)))

#Recover the vector binary tree from character tensor:
ts2vbt(ts)



