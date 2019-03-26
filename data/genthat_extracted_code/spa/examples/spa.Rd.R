library(spa)


### Name: spa
### Title: sequential prediction algorithm
### Aliases: spa print.spa ftf.fit
### Keywords: classes models methods

### ** Examples

## SPA in Multi-view Learing -- (Y,X,G) case.
## (refer to coraAI help page for more information).
## 1) fit model Y=f(G)+epsilon
## 2) fit model Y=XB+f(G)+epsilon

data(coraAI)
y=coraAI$class
x=coraAI$journals
g=coraAI$cite

##remove papers that are not cited
keep<-which(as.vector(apply(g,1,sum)>1))
y<-y[keep]
x<-x[keep,]
g=g[keep,keep]

##set up testing/training data (3.5% stratified for training)
set.seed(100)
n<-dim(x)[1]
Ns<-as.vector(apply(x,2,sum))
Ls<-sapply(1:length(Ns),function(i)sample(which(x[,i]==1),ceiling(0.035*Ns[i])))
L=NULL
for(i in 1:length(Ns)) L=c(L,Ls[[i]])
U<-setdiff(1:n,L)
ord<-c(L,U)
m=length(L)
y1<-y
y1[U]<-NA

##Fit model on G
A1=as.matrix(g)
gc=spa(y1,graph=A1,control=spa.control(dissimilar=FALSE))
gc

##Compute error rate for G only
tab=table(fitted(gc)[U]>0.5,y[U])
1-sum(diag(tab))/sum(tab)

##Note problem
sum(apply(A1[U,L],1,sum)==0)/(n-m)*100  ##Answer:  39.79849

##39.8% of unlabeled observations have no connection to a labeled one.

##Use Transuductive prediction with SPA to fix this with parameters k,l  
pred=update(gc,ynew=y1,gnew=A1,dat=list(k=length(U),l=Inf))
tab=table(pred[U]>0.5,y[U])
1-sum(diag(tab))/sum(tab)

##Replace earlier gj with the more predictive transductive model
gc=update(gc,ynew=y1,gnew=A1,dat=list(k=length(U),l=Inf),trans.update=TRUE)
gc

## (Y,X,G) case to fit Y=Xb+f(G)+e
gjc<-spa(y1,x,g,control=spa.control(diss=FALSE))
gjc

##Apply SPA as transductively to fix above problem
gjc1=update(gjc,ynew=y1,xnew=x,gnew=A1,dat=list(k=length(U),l=Inf),trans.update=TRUE)
gjc1

##Notice that the unlabeled transductive adjustment provided new estimates
sum((coef(gjc)-coef(gjc1))^2)

##Check testing performance to determine the best model settings
tab=table((fitted(gjc)>0.5)[U],y[U])
1-sum(diag(tab))/sum(tab)

tab=table((fitted(gjc1)>0.5)[U],y[U])
1-sum(diag(tab))/sum(tab)




