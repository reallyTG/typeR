library(quint)


### Name: predict.quint
### Title: Predictions for new data with a QUINT object
### Aliases: predict.quint

### ** Examples

data(bcrp)
formula1<- I(cesdt1-cesdt3)~cond | nationality+marital+wcht1+age+
  trext+comorbid+disopt1+uncomt1+negsoct1

set.seed(10)
control1<-quint.control(maxl=5,B=2)
quint1<-quint(formula1, data= subset(bcrp,cond<3),control=control1) #Grow a QUINT tree

prquint1<-prune(quint1) #Prune QUINT tree to optimal size

#Predict for the same data set the treatment classes for patients individually:
predquint1<-predict(prquint1, newdata=subset(bcrp,cond<3), type='class')
predquint1




