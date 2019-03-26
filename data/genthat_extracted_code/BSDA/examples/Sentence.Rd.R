library(BSDA)


### Name: Sentence
### Title: Sentences of 41 prisoners convicted of a homicide offense
### Aliases: Sentence
### Keywords: datasets

### ** Examples


stem(Sentence$months)
ll <- mean(Sentence$months)-2*sd(Sentence$months)
ul <- mean(Sentence$months)+2*sd(Sentence$months)
limits <- c(ll, ul)
limits
rm(ul, ll, limits)




