library(tosca)


### Name: intruderWords
### Title: Function to validate the fit of the LDA model
### Aliases: intruderWords

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
words10 <- makeWordlist(text=poliClean$text)
words10 <- words10$words[words10$wordtable > 10]
poliLDA <- LDAprep(text=poliClean$text, vocab=words10)
LDAresult <- LDAgen(documents=poliLDA, K=10, vocab=words10)
intruder <- intruderWords(beta=LDAresult$topics)
## End(No test)



