library(Xplortext)


### Name: plot.LexChar
### Title: Plot LexChar objects
### Aliases: plot.LexChar
### Keywords: plot

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), var.agg="Gen_Edu", Fmin=10, Dmin=10,
        remov.number=TRUE, stop.word.tm=TRUE)
LD<-LexChar(res.TD,maxCharDoc = 0)
plot(LD)



