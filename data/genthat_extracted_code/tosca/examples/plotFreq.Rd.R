library(tosca)


### Name: plotFreq
### Title: Plotting Counts of specified Wordgroups over Time (relative to
###   Corpus)
### Aliases: plotFreq

### ** Examples

## No test: 
data(politics)
poliClean <- cleanTexts(politics)
plotFreq(poliClean, wordlist=c("obama", "bush"))
## End(No test)



