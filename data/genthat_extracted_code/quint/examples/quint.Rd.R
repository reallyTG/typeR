library(quint)


### Name: quint
### Title: Qualitative Interaction Trees
### Aliases: quint
### Keywords: cluster tree

### ** Examples

#EXAMPLE with data from the Breast Cancer Recovery Project
data(bcrp)
#Start with expliciting the model for quint
#The outcome Y is a change score between timepoint 3 and timepoint 1
#A positive Y value indicates an improvement in depression (i.e., a decrease)

formula1<- I(cesdt1-cesdt3)~cond | nationality+marital+wcht1+age+
  trext+comorbid+disopt1+uncomt1+negsoct1

#Perform a quint analysis
#The BCRP data contain 3 conditions. Quint only works now for 2 conditions.
#For the example, we disregard the control condition
#To save computation time, we also adjust the control parameters

set.seed(2)
control1<-quint.control(maxl=5,B=2) #The recommended number of bootstraps is 25.
quint1<-quint(formula1, data= subset(bcrp,cond<3),control=control1)
quint1pr<-prune(quint1)

#Inspect the main results of the analysis:
summary(quint1pr)

#plot the tree
plot(quint1pr)




