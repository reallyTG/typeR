library(ngstk)


### Name: split_row_file
### Title: Function to split big file to a series small files (by row)
### Aliases: split_row_file

### ** Examples

dat <- data.frame(col1 = 1:1000)
outfn <- tempfile()
write.table(dat, outfn, sep = '\t', quote = FALSE, row.names = FALSE)
split_row_file(outfn)



