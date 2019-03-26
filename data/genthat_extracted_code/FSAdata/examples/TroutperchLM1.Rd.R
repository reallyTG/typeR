library(FSAdata)


### Name: TroutperchLM1
### Title: Ages, lengths, and sexes of Troutperch.
### Aliases: TroutperchLM1
### Keywords: datasets

### ** Examples

data(TroutperchLM1)
str(TroutperchLM1)
head(TroutperchLM1)
op <- par(mfrow=c(1,2),pch=19)
plot(tl~age,data=TroutperchLM1,subset=sex=="f",main="female")
plot(tl~age,data=TroutperchLM1,subset=sex=="m",main="male")
par(op)




