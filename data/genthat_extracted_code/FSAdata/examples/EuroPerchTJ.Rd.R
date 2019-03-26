library(FSAdata)


### Name: EuroPerchTJ
### Title: Ages, lengths, and sexes of European Perch.
### Aliases: EuroPerchTJ
### Keywords: datasets

### ** Examples

data(EuroPerchTJ)
str(EuroPerchTJ)
head(EuroPerchTJ)
op <- par(mfrow=c(1,2),pch=19)
plot(fl~age,data=EuroPerchTJ,subset=sex=="female",main="Female")
plot(fl~age,data=EuroPerchTJ,subset=sex=="male",main="Male")
par(op)




