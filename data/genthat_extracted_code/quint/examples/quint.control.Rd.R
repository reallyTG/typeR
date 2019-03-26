library(quint)


### Name: quint.control
### Title: Control Parameters for QUINT Algorithm
### Aliases: quint.control

### ** Examples

data(bcrp)
formula1<- I(cesdt1-cesdt3)~cond | nationality+marital+wcht1+age+
  trext+comorbid+disopt1+uncomt1+negsoct1
#Specify the Difference in treatment outcome as Difference in means
#and skip the bias-corrected bootstrap procedure
#and change the maximum number of leaves
control3<-quint.control(crit="dm",Bootstrap=FALSE,maxl=3)
quint3<-quint(formula1, data= subset(bcrp,cond<3),control=control3)
summary(quint3)

#Set number of bootstrap samples at 30
control4<-quint.control(B=30)

#Set minimal sample size in each treatment group at 5
control5<-quint.control(a1=5,a2=5)




