library(HadoopStreaming)


### Name: hsLineReader
### Title: A wrapper for readLines
### Aliases: hsLineReader

### ** Examples

  str <- "Hello here are some\nlines of text\nto read in, chunkSize\nlines at a time.\nHow interesting.\nhuh?"
  cat(str)
  con <- textConnection(str, open = "r")
  hsLineReader(con,chunkSize=-1,FUN=print)
  close(con)
  con <- textConnection(str, open = "r")
  hsLineReader(con,chunkSize=3,skip=1,FUN=print)
  close(con)



