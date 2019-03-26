library(FSAdata)


### Name: Croaker2
### Title: Ages, lengths, and sexes of Atlantic Croaker by sex.
### Aliases: Croaker2
### Keywords: datasets

### ** Examples

data(Croaker2)
str(Croaker2)
head(Croaker2)
op <- par(mfrow=c(1,2),pch=19)
plot(tl~age,data=Croaker2,subset=sex=="F",main="Female")
plot(tl~age,data=Croaker2,subset=sex=="M",main="Male")
par(op)




