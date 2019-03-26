library(VBTree)


### Name: dl2vbt
### Title: Convert a double list to vector binary tree
### Aliases: dl2vbt
### Keywords: Double.List Vector.Binary.Tree

### ** Examples

#Structurize the column names of datatest:
colname <- colnames(datatest)
colnamedl <- chrvec2dl(colname, "-")
colnamevbt <- dl2vbt(colnamedl)

#Simple data cleaning for sub-constructure existing double list;
#Make unregulated double list:
unregdl <- list(c("7", 2, 10), c("chr", "5"), c(),
c("var2", "var1", "var3"), c("M-8-9", "3-2"), c("6-3", "2-7"))
regvbt <- dl2vbt(unregdl)
regvbt2 <- dl2vbt(unregdl, FALSE) # not recommended



