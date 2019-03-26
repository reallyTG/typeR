library(arabicStemR)


### Name: arabicStemR-package
### Title: A package for stemming Arabic for text analysis.
### Aliases: arabicStemR-package arabicStemR
### Keywords: package

### ** Examples

# Load data

data(aljazeera)

## stem and transliterate the results
stem(aljazeera)

## stem and return the stemlist
out <- stem(aljazeera,returnStemList=TRUE)
out$text
out$stemlist



