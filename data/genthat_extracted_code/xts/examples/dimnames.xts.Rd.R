library(xts)


### Name: dimnames.xts
### Title: Dimnames of an xts Object
### Aliases: dimnames.xts dimnames<-.xts
### Keywords: misc

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
dimnames(x)
rownames(x)
rownames(x) <- 1:10
rownames(x)
str(x)



