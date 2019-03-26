library(crqanlp)


### Name: clean_text
### Title: Clean text
### Aliases: clean_text
### Keywords: misc

### ** Examples


library(gutenbergr)
## let's get Alice's Adventures in Wonderland by Carroll
# gutenberg_works(author == "Carroll, Lewis") 
rawText = gutenberg_download(11) ## take the text
rawText = as.vector(rawText$text) ## vectorize the text
rawText = paste(rawText, collapse = " ") ## collapse the text

cleanText = clean_text(rawText, removeStopwords = TRUE)
text      = cleanText$content




