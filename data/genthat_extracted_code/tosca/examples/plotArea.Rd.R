library(tosca)


### Name: plotArea
### Title: Plotting topics over time as stacked areas below plotted lines.
### Aliases: plotArea

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
words10 <- makeWordlist(text=poliClean$text)
words10 <- words10$words[words10$wordtable > 10]
poliLDA <- LDAprep(text=poliClean$text, vocab=words10)
LDAresult <- LDAgen(documents=poliLDA, K=10, vocab=words10)
plotArea(ldaresult=LDAresult, ldaID=names(poliLDA), meta=politics$meta)

plotArea(ldaresult=LDAresult, ldaID=names(poliLDA), meta=politics$meta, select=c(1,3,5))
## End(No test)



