library(ngstk)


### Name: batch_file
### Title: Process the input file a batch of one batch
### Aliases: batch_file

### ** Examples

dat <- data.frame(a=1:100, b=1:100)
filename <- tempfile()
write.table(dat, filename, sep = '\t', row.names = FALSE, quote = FALSE)
handler_fun <- function(x, i = 1) {
  return(x[i])
}
batch_file(filename, 10, handler_fun)



