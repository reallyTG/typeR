library(agricolae)


### Name: heterosis
### Title: Data of potato, Heterosis
### Aliases: heterosis
### Keywords: datasets

### ** Examples

library(agricolae)
data(heterosis)
str(heterosis)
site1<-subset(heterosis,heterosis[,1]==1)
site2<-subset(heterosis,heterosis[,1]==2)
site3<-subset(heterosis,heterosis[,1]==3)
model1<-with(site1,lineXtester(Replication, Female, Male, v1))
DFe <- df.residual(model1)
CMe <- deviance(model1)/DFe
test1 <- with(site1,HSD.test(v1, Factor,DFe,CMe))
test2 <- with(site1,HSD.test(v1, Treatment,DFe,CMe))
model22<-with(site2,lineXtester(Replication, Female, Male, v3))
model3<-with(site3,lineXtester(Replication, Female, Male, v4))



