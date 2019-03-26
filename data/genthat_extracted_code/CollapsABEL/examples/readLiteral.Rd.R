library(CollapsABEL)


### Name: readLiteral
### Title: Read a file literally (all columns as character)
### Aliases: readLiteral

### ** Examples

## Not run: 
##D df = data.frame(x = c("T", "%T", "10341"), 
##D 		y = c("F", "f%t", "431"), 
##D 		z = c("T", "TRUE", "FALSE"))
##D tmpf = tempfile()
##D write.table(df, file = tmpf, quote = FALSE, 
##D 		row.names = FALSE, col.names = FALSE)
##D df1 = readLiteral(file = tmpf)
##D all(df1 == df)
## End(Not run)




