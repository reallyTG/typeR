library(filenamer)


### Name: insert
### Title: Insert tag or extension into a file name
### Aliases: insert insert.character insert.filename

### ** Examples

f <- as.filename("data_expr_2014-05-01.tsv")

# new file name with inserted tags for saving normalized data
g <- insert(f, tag=c("mod", "norm"))
print(as.character(g))

# new file name with inserted extension for saving sorted data
h <- insert(f, ext="sorted")
print(as.character(h))

# new file name with different extension for saving in different format
i <- insert(f, ext="csv", replace=TRUE)
print(as.character(i))

# insert another tag
j <- insert(g, tag="qc", tag.pos=2)
print(as.character(j))



