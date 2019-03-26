library(Xplortext)


### Name: print.LexChar
### Title: Print LexChar objects
### Aliases: print.LexChar
### Keywords: print

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), var.agg="Gen_Edu", Fmin=10, Dmin=10,
        stop.word.tm=TRUE)
LD<-LexChar(res.TD, maxCharDoc = 0)
print(LD)



