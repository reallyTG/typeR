library(tosca)


### Name: topicsInText
### Title: Coloring the words of a text corresponding to topic allocation
### Aliases: topicsInText

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
words10 <- makeWordlist(text=poliClean$text)
words10 <- words10$words[words10$wordtable > 10]
poliLDA <- LDAprep(text=poliClean$text, vocab=words10)
LDAresult <- LDAgen(documents=poliLDA, K=10, vocab=words10)
topicsInText(text=politics$text, ldaID=names(poliLDA), id="ID2756",
             ldaresult=LDAresult, vocab=words10)
## End(No test)



