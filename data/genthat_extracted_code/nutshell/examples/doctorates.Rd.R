library(nutshell)


### Name: doctorates
### Title: Doctorates Awarded in the United States, 2001-2006
### Aliases: doctorates
### Keywords: datasets

### ** Examples

data(doctorates)
# make this into a matrix:
doctorates.m <- as.matrix(doctorates[2:7])
rownames(doctorates.m) > doctorates.m
barplot(doctorates.m,beside=TRUE,horiz=TRUE,legend=TRUE,cex.names=.75)
barplot(t(doctorates.m),legend=TRUE,ylim=c(0,66000))



