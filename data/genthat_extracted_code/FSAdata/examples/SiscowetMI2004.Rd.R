library(FSAdata)


### Name: SiscowetMI2004
### Title: Ages (subsample) and lengths (all fish) for male and female
###   Siscowet Lake Trout captured at four locations in Michigan waters of
###   Lake Superior.
### Aliases: SiscowetMI2004
### Keywords: datasets

### ** Examples

data(SiscowetMI2004)
str(SiscowetMI2004)
head(SiscowetMI2004)
xtabs(~age+locID,data=SiscowetMI2004)
op <- par(mfrow=c(2,2),pch=19)
plot(len~age,data=SiscowetMI2004,subset=locID=="Blind Sucker",main="Blind Sucker")
plot(len~age,data=SiscowetMI2004,subset=locID=="Grand Marais",main="Grand Marais")
plot(len~age,data=SiscowetMI2004,subset=locID=="Little Lake Harbor",main="Little Lake Harbor")
par(op)




