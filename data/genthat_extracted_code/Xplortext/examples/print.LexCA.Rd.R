library(Xplortext)


### Name: print.LexCA
### Title: Print LexCA objects
### Aliases: print.LexCA
### Keywords: print

### ** Examples

data(open.question)
res.TD<-TextData(open.question,var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10,
        remov.number=TRUE, stop.word.tm=TRUE)
res.LexCA<-LexCA(res.TD,lmd=0,lmw=1)
print(res.LexCA)



