library(braQCA)


### Name: baQCA
### Title: Boostrapped Assessment
### Aliases: baQCA

### ** Examples

data(rallies)
P<-rallies$P
R<-rallies$R
C<-rallies$C
U<-rallies$U

qca.data<-data.frame(P,R,C,U)
rownames(qca.data)<-rownames(rallies)
truth<-truthTable(qca.data,outcome="P",sort.by="incl",incl.cut1=0.7,show.cases=TRUE)
truth
mod1 <- minimize(truth,details=TRUE,show.cases=TRUE)
mod1

baQCA(mod1,sim=5) 



