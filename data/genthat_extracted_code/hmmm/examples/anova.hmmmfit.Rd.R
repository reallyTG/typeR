library(hmmm)


### Name: anova.hmmmfit
### Title: anova for the class hmmmfit
### Aliases: anova.hmmmfit
### Keywords: package

### ** Examples
data(madsen)
y<-getnames(madsen)
names<-c("Infl","Sat","Co","Ho")

fA<-~Co*Ho+Sat*Co+Sat*Ho
modelA<-loglin.model(lev=c(3,3,2,4),formula=fA,names=names)
fB<-~Co*Ho+Sat*Co+Infl*Co+Sat*Ho+Infl*Sat
modelB<-loglin.model(lev=c(3,3,2,4),formula=fB,names=names)

modA<-hmmm.mlfit(y,modelA)
modB<-hmmm.mlfit(y,modelB)

anova(modA,modB)



