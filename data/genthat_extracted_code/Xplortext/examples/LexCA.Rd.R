library(Xplortext)


### Name: LexCA
### Title: Correspondence Analysis of a Lexical Table from a TextData
###   object (LexCA)
### Aliases: LexCA
### Keywords: multivariate

### ** Examples

data(open.question)
## Not run: 
##D ### non-aggregate CA
##D res.TD<-TextData(open.question, var.text=c(9,10), Fmin=10, Dmin=10,
##D         remov.number=TRUE, stop.word.tm=TRUE)
##D res.LexCA<-LexCA(res.TD, lmd=0, lmw=1)
## End(Not run)

### aggregate CA
res.TD<-TextData(open.question, var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10,
        remov.number=TRUE, stop.word.tm=TRUE)
res.LexCA<-LexCA(res.TD, lmd=0, lmw=1)



