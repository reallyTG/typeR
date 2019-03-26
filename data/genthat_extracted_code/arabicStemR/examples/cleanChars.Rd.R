library(arabicStemR)


### Name: cleanChars
### Title: Clean all characters that are not Latin or Arabic
### Aliases: cleanChars
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Create string with Arabic, latin, and Hebrew characters 

x <- '\u0627\u0647\u0644\u0627 \u0648\u0633\u0647\u0644\u0627 Hello \u05d0'

## Remove characters from string that are not Arabic or latin

cleanChars(x)



