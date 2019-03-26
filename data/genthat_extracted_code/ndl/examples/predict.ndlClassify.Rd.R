library(ndl)


### Name: predict.ndlClassify
### Title: Predict method for ndlClassify objects
### Aliases: predict.ndlClassify
### Keywords: classif

### ** Examples


data(think)
think.ndl <- ndlClassify(Lexeme ~ Agent + Patient, data=think[1:300,])
head(predict(think.ndl, type="choice"))
predict(think.ndl, newdata=think[301:320,], type="probs")
predict(think.ndl, newdata=think[301:320,], type="acts")




