library(popbio)


### Name: logi.hist.plot
### Title: Plot logistic regression
### Aliases: logi.hist.plot
### Keywords: survey

### ** Examples


data(aq.trans)

aq.trans$survived<-aq.trans$fate!="dead"

a<-subset(aq.trans, leaf<50 & stage!="recruit", c(leaf,survived))

logi.hist.plot(a$leaf,  a$survived, 
type="hist", boxp=FALSE, counts=TRUE, int=10, 
ylabel="Survival probability", ylabel2="Number of plants", 
 xlab="Number of leaves" )



b<-glm(survived ~ leaf, binomial, data=a)
 summary(b)





