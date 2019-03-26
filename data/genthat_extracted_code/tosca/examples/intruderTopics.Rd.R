library(tosca)


### Name: intruderTopics
### Title: Function to validate the fit of the LDA model
### Aliases: intruderTopics

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
words10 <- makeWordlist(text=poliClean$text)
words10 <- words10$words[words10$wordtable > 10]
poliLDA <- LDAprep(text=poliClean$text, vocab=words10)
LDAresult <- LDAgen(documents=poliLDA, K=10, vocab=words10)
intruder <- intruderTopics(text=politics$text, beta=LDAresult$topics,
                           theta=LDAresult$document_sums, id=names(poliLDA))
## End(No test)



