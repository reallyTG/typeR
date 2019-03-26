library(fpeek)


### Name: peek_head
### Title: print the first lines of files
### Aliases: peek_head

### ** Examples

f <- system.file(package = "fpeek",
  "datafiles", "cigfou-ISO-8859-1.txt")
peek_head(f, n = 4)
peek_head(f, n = 4, intern = TRUE)



