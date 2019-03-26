library(arabicStemR)


### Name: removeNewlineChars
### Title: Remove new line characters
### Aliases: removeNewlineChars
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Create string with Arabic characters 

x <- '\u0627\u0647\u0644\u0627 \u0648\u0633\u0647\u0644\u0627
      \u0627\u0647\u0644\u0627 \u0648\u0633\u0647\u0644\u0627'

## Remove newline characters (gets rid of \n\r\t\f\v)

removeNewlineChars(x)  



