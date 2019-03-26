library(braQCA)


### Name: QCAdiff
### Title: QCA Case Difference
### Aliases: QCAdiff

### ** Examples

data(rallies)
P<-rallies$P
R<-rallies$R
C<-rallies$C
B<-rallies$B

qca.data<-data.frame(P,R,C,B)
rownames(qca.data)<-rownames(rallies)
truth<-truthTable(qca.data,outcome="P",sort.by="incl",incl.cut1=0.2,show.cases=TRUE,n.cut=1)
mod1<-minimize(truth,details=TRUE,show.cases=TRUE)
mod1

truth2<-truthTable(qca.data,outcome="P",sort.by="incl",incl.cut1=0.7,show.cases=TRUE,n.cut=3)
mod2<-minimize(truth2,details=TRUE,show.cases=TRUE)
mod2

QCAdiff(mod1,mod2,show=FALSE)



