library(fpeek)


### Name: peek_iconv
### Title: Converts encoding of characters
### Aliases: peek_iconv

### ** Examples

la_cigale <- system.file(package = "fpeek", "datafiles",
  "cigfou-ISO-8859-1.txt")

peek_head(la_cigale)
peek_iconv(la_cigale, from = "ISO-8859-1", to = "UTF-8")

newfile <- tempfile()
peek_iconv(la_cigale, from = "ISO-8859-1", to = "UTF-8",
  newfile = newfile)
peek_head(newfile, n = 10)




