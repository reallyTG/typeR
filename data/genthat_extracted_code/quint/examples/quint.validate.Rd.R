library(quint)


### Name: quint.validate
### Title: Validation of a Qualitative Interaction Tree
### Aliases: quint.validate

### ** Examples

data(bcrp)
formula1<- I(cesdt1-cesdt3)~cond | nationality+marital+wcht1+age+
  trext+comorbid+disopt1+uncomt1+negsoct1

set.seed(10)
control1<-quint.control(maxl=4,B=2)
quint1<-quint(formula1, data= subset(bcrp,cond<3),control=control1) #Grow a QUINT tree

prquint1<-prune(quint1) #Prune tree to optimal size

set.seed(3)
valquint1<-quint.validate(prquint1, B = 5) #estimate the optimism by bootstrapping 5 times
valquint1




