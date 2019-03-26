library(ngstk)


### Name: merge_table_files
### Title: Util function to merge multiple table files.
### Aliases: merge_table_files

### ** Examples

a <- data.frame(col1=1:6, col2=2:7)
b <- data.frame(col1=6:11, col2=1:6)
file_a <- paste0(tempfile(), '_abcd')
file_b <- paste0(tempfile(), '_abcd')
write.table(a, file_a, sep = '\t', row.names = FALSE)
write.table(b, file_b, sep = '\t', row.names = FALSE)
input_files <- c(file_a, file_b)
x1 <- merge_table_files(input_files = input_files)
x2 <- merge_table_files(files_dir = tempdir(), pattern = '.*_abcd$')
outfn = tempfile()



