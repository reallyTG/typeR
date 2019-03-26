library(tosca)


### Name: plotWordSub
### Title: Plotting Counts/Proportion of Words/Docs in LDA-generated
###   Topic-Subcorpora over Time
### Aliases: plotWordSub

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
poliPraesidents <- filterWord(object=poliClean, search=c("bush", "obama"))
words10 <- makeWordlist(text=poliPraesidents$text)
words10 <- words10$words[words10$wordtable > 10]
poliLDA <- LDAprep(text=poliPraesidents$text, vocab=words10)
LDAresult <- LDAgen(documents=poliLDA, K=5, vocab=words10)
plotWordSub(object=poliClean, ldaresult=LDAresult, ldaID=names(poliLDA), search="obama")
## End(No test)



