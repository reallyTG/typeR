library(HadoopStreaming)


### Name: hsKeyValReader
### Title: Reads key value pairs
### Aliases: hsKeyValReader

### ** Examples

  printFn <- function(k,v) {
    cat('A chunk:\n')
    cat(paste(k,v,sep=': '),sep='\n')
  }
  str <- "key1\tval1\nkey2\tval2\nkey3\tval3\n"
  cat(str)
  con <- textConnection(str, open = "r")
  hsKeyValReader(con,chunkSize=2,FUN=printFn)
  close(con)
  con <- textConnection(str, open = "r")
  hsKeyValReader(con,FUN=printFn)
  close(con)



