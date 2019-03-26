library(VBTree)


### Name: ts2dl
### Title: Convert a structured character tensor to double list
### Aliases: ts2dl
### Keywords: Double.List tensor

### ** Examples

#Write the column names of datatest into a tensor:
ts <- dl2ts(chrvec2dl(colnames(datatest)))

#Recover the double list from character tensor:
ts2dl(ts)



