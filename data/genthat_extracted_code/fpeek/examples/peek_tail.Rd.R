library(fpeek)


### Name: peek_tail
### Title: print the last lines of files
### Aliases: peek_tail

### ** Examples

f <- system.file(package = "fpeek",
  "datafiles", "cigfou-ISO-8859-1.txt")
peek_tail(f, n = 4)
peek_tail(f, n = 4, intern = TRUE)



