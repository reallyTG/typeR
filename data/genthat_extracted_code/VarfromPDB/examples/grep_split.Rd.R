library(VarfromPDB)


### Name: grep_split
### Title: Extention for grep function
### Aliases: grep_split
### Keywords: grep

### ** Examples

x <- c("you and he and I", "you", "Tom", "I", "you and I", "he and I")
grep_split("you and I | Tom", x)
#[1] 1 5 3



