library(fst)


### Name: fst
### Title: Access a fst file like a regular data frame
### Aliases: fst

### ** Examples

## Not run: 
##D # generate a sample fst file
##D path <- paste0(tempfile(), ".fst")
##D write_fst(iris, path)
##D 
##D # create a fst_table object that can be used as a data frame
##D ft <- fst(path)
##D 
##D # print head and tail
##D print(ft)
##D 
##D # select columns and rows
##D x <- ft[10:14, c("Petal.Width", "Species")]
##D 
##D # use the common list interface
##D ft[TRUE]
##D ft[c(TRUE, FALSE)]
##D ft[["Sepal.Length"]]
##D ft$Petal.Length
##D 
##D # use data frame generics
##D nrow(ft)
##D ncol(ft)
##D dim(ft)
##D dimnames(ft)
##D colnames(ft)
##D rownames(ft)
##D names(ft)
## End(Not run)



