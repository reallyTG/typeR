library(sfsmisc)


### Name: vcat
### Title: Paste Utilities - Concatenate Strings
### Aliases: vcat ccat
### Keywords: print utilities

### ** Examples

ch <- "is"
ccat("This ", ch, " it: ", 100, "%")
vv <- c(1,pi, 20.4)
vcat(vv)
vcat(vv, sep = ", ")



