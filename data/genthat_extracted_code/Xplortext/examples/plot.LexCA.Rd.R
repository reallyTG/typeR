library(Xplortext)


### Name: plot.LexCA
### Title: Plot of LexCA objects
### Aliases: plot.LexCA
### Keywords: plot

### ** Examples

data(open.question)
res.TD<-TextData(open.question,var.text=c(9,10), var.agg="Age_Group", Fmin=10, Dmin=10,
        remov.number=TRUE, stop.word.tm=TRUE)
resCA <- LexCA(res.TD, graph=FALSE)
plot(resCA, selDoc="contrib 30", selWord="coord 20")



