library(FSAdata)


### Name: WhiteGrunt2
### Title: Ages, lengths, and sexes of White Grunt.
### Aliases: WhiteGrunt2
### Keywords: datasets

### ** Examples

data(WhiteGrunt2)
str(WhiteGrunt2)
head(WhiteGrunt2)
op <- par(mfrow=c(1,2),pch=19)
plot(tl~age,data=WhiteGrunt2,subset=sex=="female",main="Female")
plot(tl~age,data=WhiteGrunt2,subset=sex=="male",main="Male")
par(op)




