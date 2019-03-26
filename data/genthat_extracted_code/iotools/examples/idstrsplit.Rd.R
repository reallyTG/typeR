library(iotools)


### Name: idstrsplit
### Title: Create an iterator for splitting binary or character input into
###   a dataframe
### Aliases: idstrsplit
### Keywords: iterator

### ** Examples

col_names <- names(iris)
write.csv(iris, file="iris.csv", row.names=FALSE)
it <- idstrsplit("iris.csv", col_types=c(rep("numeric", 4), "character"), 
                 sep=",")
# Get the elements
iris_read <- it$nextElem()[-1,]
# or with the iterators package
# nextElem(it)
names(iris_read) <- col_names
print(head(iris_read))
unlink("iris.csv")



