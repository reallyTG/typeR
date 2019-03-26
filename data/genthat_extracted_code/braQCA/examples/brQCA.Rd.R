library(braQCA)


### Name: brQCA
### Title: Bootstrapped Recommendation
### Aliases: brQCA

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

brQCA(qca.data,outcome="P",ncut=1,sim=1)



