library(FSAdata)


### Name: RuffeSLRH92
### Title: Biological data for Ruffe captured from the St. Louis River in
###   1992.
### Aliases: RuffeSLRH92
### Keywords: datasets

### ** Examples

data(RuffeSLRH92)
str(RuffeSLRH92)
head(RuffeSLRH92)
op <- par(mfrow=c(2,2),pch=19)
hist(RuffeSLRH92$length,main="")
hist(RuffeSLRH92$age,main="")
plot(weight~length,data=RuffeSLRH92)
plot(length~age,data=RuffeSLRH92)
par(op)
xtabs(~age,data=RuffeSLRH92)
xtabs(~sex,data=RuffeSLRH92)
tmp <- c("yoy","immature","developing","mature","nearly.ripe","ripe",
         "running","nearly.spent","spent","recovering","unknown")
RuffeSLRH92$maturity <- ordered(RuffeSLRH92$maturity,levels=tmp)
xtabs(~maturity,data=RuffeSLRH92)
xtabs(~maturity+month+sex,data=RuffeSLRH92)




