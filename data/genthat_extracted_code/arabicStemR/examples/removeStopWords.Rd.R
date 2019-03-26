library(arabicStemR)


### Name: removeStopWords
### Title: Remove Arabic stopwords.
### Aliases: removeStopWords
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create string with Arabic characters

x <- '\u0627\u0647\u0644\u0627 \u0648\u0633\u0647\u0644\u0627
 \u064a\u0627  \u0635\u062f\u064a\u0642\u064a'

## Remove stop words
removeStopWords(x)$text

## Not run
## To see the full list of stop words 
## removeStopWords(x)$arabicStopwordList




