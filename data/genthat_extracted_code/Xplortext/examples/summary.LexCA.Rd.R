library(Xplortext)


### Name: summary.LexCA
### Title: Summary LexCA object
### Aliases: summary.LexCA

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), Fmin=10, Dmin=10, stop.word.tm=TRUE)
res.LexCA<-LexCA(res.TD, lmd=1, lmw=1)
summary(res.LexCA)



