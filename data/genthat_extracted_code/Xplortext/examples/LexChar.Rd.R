library(Xplortext)


### Name: LexChar
### Title: Characteristic words and documents (LexChar)
### Aliases: LexChar
### Keywords: multivariate

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), var.agg="Gen_Edu", Fmin=10, Dmin=10, 
        remov.number=TRUE, stop.word.tm=TRUE)
LexChar(res.TD)



