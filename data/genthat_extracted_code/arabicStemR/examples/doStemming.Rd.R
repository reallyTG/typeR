library(arabicStemR)


### Name: doStemming
### Title: Removes Arabic prefixes and suffixes
### Aliases: doStemming
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create string with Arabic characters

x <- '\u0627\u0644\u0644\u063a\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629
 \u062c\u0645\u064a\u0644\u0629 \u062c\u062f\u0627'


## Remove prefixes and suffixes

y<-doStemming(x)

y$text
y$stemmedWords




