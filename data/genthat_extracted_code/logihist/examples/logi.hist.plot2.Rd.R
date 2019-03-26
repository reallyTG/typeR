library(logihist)


### Name: logi.hist.plot2
### Title: Plot logistic regression
### Aliases: logi.hist.plot2
### Keywords: ~survey

### ** Examples


data(aq.trans, package="popbio")

aq.trans$survived<-aq.trans$fate!="dead"

a<-subset(aq.trans, leaf<50 & stage!="recruit", c(leaf,survived))

logi.hist.plot2(a$leaf,  a$survived, 
type="hist", boxp=FALSE, counts=TRUE, int=10, 
ylabel="Survival probability", ylabel2="Number of plants", 
 xlab="Number of leaves" )

b<-glm(survived ~ leaf, binomial, data=a)
 summary(b)





