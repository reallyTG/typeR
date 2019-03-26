library(Maeswrap)


### Name: revchar
### Title: Reverse a character string.
### Aliases: revchar
### Keywords: methods

### ** Examples

## Not run: 
##D # Take a substring, counting from the end:
##D substrfromend <- function(x,start,stop)revchar(substr(revchar(x),start,stop))
##D substrfromend('filename.txt', 1,3)
##D 
##D # Check if a word is a palindrome:
##D s <- 'saippuakivikauppias'
##D s == revchar(s)
##D 
##D # A semordnilap:
##D cat('I am so stressed, I need to eat', revchar('stressed'),'\n')
## End(Not run)



