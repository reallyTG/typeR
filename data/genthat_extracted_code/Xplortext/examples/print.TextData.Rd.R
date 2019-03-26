library(Xplortext)


### Name: print.TextData
### Title: Print TextData objects
### Aliases: print.TextData
### Keywords: print

### ** Examples

data(open.question)
res.TD<-TextData(open.question, var.text=c(9,10), remov.number=TRUE, Fmin=10, Dmin=10,  
stop.word.tm=TRUE, context.quali=c("Gender","Age_Group","Education"),
   context.quanti=c("Age"))
print(res.TD)



