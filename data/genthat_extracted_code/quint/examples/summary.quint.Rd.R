library(quint)


### Name: summary.quint
### Title: Summarizing Qualitative Interaction Tree Information
### Aliases: summary.quint
### Keywords: summary

### ** Examples

data(bcrp)
formula1<- I(cesdt1-cesdt3)~cond | nationality+marital+wcht1+
  age+trext+comorbid+disopt1+uncomt1+negsoct1
control1<-quint.control(maxl=5,Bootstrap=FALSE)
quint1<-quint(formula1, data= subset(bcrp,cond<3),control=control1 )
summary(quint1)

##############################################3
# Example with only root node tree as outcome
data(SimData_1)
formula<- Y~A |X1+X2+X3+X4+X5
#Adjust the control parameters only to save computation time in the example;
#The default control parameters are preferred
control<-quint.control(maxl=5,B=2)
set.seed(2) #this enables you to repeat the results of the bootstrap procedure
quint_1<-quint(formula, data= SimData_1,control=control)
quint_1pr<-prune(quint_1)
summary(quint_1pr)




