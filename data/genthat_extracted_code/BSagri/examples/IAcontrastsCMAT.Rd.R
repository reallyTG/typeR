library(BSagri)


### Name: IAcontrastsCMAT
### Title: Interaction contrasts for a two-factorial design
### Aliases: IAcontrastsCMAT
### Keywords: htest

### ** Examples



library(multcomp)


n1<-c(10,10,10,10)
names(n1)<-c("A","B","C","D")

n2<-c(3,3,3)
names(n2)<-c(1,2,3)

CMT1<-contrMat(n1, type="Tukey")

CMT2<-contrMat(n2, type="Tukey")

IAC<-IAcontrastsCMAT(CMAT1=CMT1, CMAT2=CMT2)

c2compnames(IAC, ntype="sequ")

###


n1<-c(10,10,10,10)
names(n1)<-c("A","B","C","D")

n2<-c(3,3,3)
names(n2)<-c(1,2,3)

CMD1<-contrMat(n1, type="Dunnett")

CMD2<-contrMat(n2, type="Dunnett")

IAC<-IAcontrastsCMAT(CMAT1=CMD1, CMAT2=CMD2)

c2compnames(IAC, ntype="sequ")





