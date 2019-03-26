library(MPV)


### Name: oldwash
### Title: oldwash
### Aliases: oldwash
### Keywords: datasets

### ** Examples


oldwash.lm<-lm(log(time)~startT+endT+Vol+alc+who+batch,data=oldwash)
summary(oldwash.lm)
par(mfrow=c(2,2))
plot(oldwash.lm)

data2<-subset(oldwash,batch==2)
hist(data2$time)
data1<-subset(oldwash,batch==1)
hist(data1$time)

oldwash.lmc<-lm(time~startT+endT+Vol+alc+who+batch,data=data1)
summary(oldwash.lmc)
plot(oldwash.lmc)

oldwash.lmd<-lm(time~startT+endT+Vol+alc+who+batch,data=data2)
summary(oldwash.lmd)
plot(oldwash.lmd)




