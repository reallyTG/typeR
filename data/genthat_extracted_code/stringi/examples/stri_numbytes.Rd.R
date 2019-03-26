library(stringi)


### Name: stri_numbytes
### Title: Count the Number of Bytes
### Aliases: stri_numbytes

### ** Examples

stri_numbytes(letters)
stri_numbytes(c('abc', '123', '\u0105\u0104'))

## Not run: 
##D # this used to fail on Windows, as there was no native support for 4-bytes
##D # Unicode characters; see, however, stri_escape_unicode():
##D stri_numbytes('\U7fffffff') # compare stri_length('\U7fffffff')
## End(Not run)




