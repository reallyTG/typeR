### R code from vignette source 'doBy.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: doBy.Rnw:34-37
###################################################
#require( doBy )
prettyVersion <- packageDescription("doBy")$Version
prettyDate <- format(Sys.Date())


###################################################
### code chunk number 2: doBy.Rnw:82-87
###################################################
library(doBy)
dir.create("figures")
oopt <- options()
options("digits"=4, "width"=80, "prompt"=" ", "continue"="  ")
options(useFancyQuotes="UTF-8")


###################################################
### code chunk number 3: doBy.Rnw:110-111
###################################################
library(doBy)


###################################################
### code chunk number 4: doBy.Rnw:127-132
###################################################
data(CO2)
CO2 <- transform(CO2, Treat=Treatment, Treatment=NULL)
levels(CO2$Treat) <- c("nchil","chil")
levels(CO2$Type)  <- c("Que","Mis")
CO2 <- subset(CO2, Plant %in% c("Qn1", "Qc1", "Mn1", "Mc1"))


###################################################
### code chunk number 5: doBy.Rnw:144-145
###################################################
airquality <- subset(airquality, Month %in% c(5,6))


###################################################
### code chunk number 6: doBy.Rnw:175-178
###################################################
myfun1 <- function(x){c(m=mean(x), s=sd(x))}
summaryBy(cbind(conc, uptake, lu=log(uptake)) ~ Plant, 
          data=CO2, FUN=myfun1)


###################################################
### code chunk number 7: doBy.Rnw:182-183
###################################################
summaryBy(conc ~ Plant, data=CO2, FUN=mean)


###################################################
### code chunk number 8: doBy.Rnw:190-196
###################################################
## Will fail because of log(uptake)
## summaryBy(list(c("conc", "uptake", "log(uptake)"), "Plant"), 
##          data=CO2, FUN=myfun1)
## Works
summaryBy(list(c("conc", "uptake"), "Plant"), 
          data=CO2, FUN=myfun1)


###################################################
### code chunk number 9: doBy.Rnw:233-235
###################################################
x1 <- orderBy(~ Temp + Month, data=airquality)
head(x1)


###################################################
### code chunk number 10: doBy.Rnw:241-242
###################################################
x2 <- orderBy(~ - Temp + Month, data=airquality)


###################################################
### code chunk number 11: doBy.Rnw:246-248
###################################################
x3 <- orderBy(c("Temp", "Month"), data=airquality)
x4 <- orderBy(c("-Temp", "Month"), data=airquality)


###################################################
### code chunk number 12: doBy.Rnw:275-278
###################################################
x <- splitBy(~ Month, data=airquality)
lapply(x, head, 4)
attributes(x)


###################################################
### code chunk number 13: doBy.Rnw:282-283
###################################################
splitBy("Month", data=airquality)


###################################################
### code chunk number 14: doBy.Rnw:302-304
###################################################
x <- subsetBy(~Month, subset=Wind > mean(Wind), data=airquality)
head(x)


###################################################
### code chunk number 15: doBy.Rnw:323-327
###################################################
x <- transformBy(~Month, data=airquality, 
                 minW=min(Wind), maxW=max(Wind),
                 chg = diff(range(Wind)))
head(x)


###################################################
### code chunk number 16: doBy.Rnw:331-334
###################################################
x <- transformBy("Month", data=airquality, 
                 minW=min(Wind), maxW=max(Wind),
                 chg = diff(range(Wind)))


###################################################
### code chunk number 17: doBy.Rnw:457-463
###################################################
ff  <- function(a, b=2, c=4){a + b + c}
ff1 <- specialize(ff, arglist=list(a=1, b=7, yy=123))
ff1
gg  <- rnorm
gg1 <- specialize(gg, list(n=10))
gg1


###################################################
### code chunk number 18: doBy.Rnw:468-471
###################################################
f  <- function(a) {a <- a + 1; a}
f1 <- specialize(f, list(a = 10))
f1


###################################################
### code chunk number 19: doBy.Rnw:481-484
###################################################
x <- c(1,1,1,2,2,2,1,1,1,3)
firstobs(x)
lastobs(x)


###################################################
### code chunk number 20: doBy.Rnw:489-491
###################################################
firstobs(~Plant, data=CO2)
lastobs(~Plant, data=CO2)


###################################################
### code chunk number 21: doBy.Rnw:500-503
###################################################
x <- c(1:4,0:5,11,NA,NA)
which.maxn(x,3)
which.minn(x,5)


###################################################
### code chunk number 22: doBy.Rnw:512-517
###################################################
x <- c(1,1,2,2,2,1,1,3,3,3,3,1,1,1)
subSeq(x)
subSeq(x, item=1)
subSeq(letters[x])
subSeq(letters[x],item="a")


###################################################
### code chunk number 23: doBy.Rnw:525-529
###################################################
x <- c("dec","jan","feb","mar","apr","may")
src1 <- list(c("dec","jan","feb"), c("mar","apr","may"))
tgt1 <- list("winter","spring")
recodeVar(x,src=src1,tgt=tgt1)


###################################################
### code chunk number 24: doBy.Rnw:536-538
###################################################
head(renameCol(CO2, 1:2, c("kk","ll")))
head(renameCol(CO2, c("Plant","Type"), c("kk","ll")))


###################################################
### code chunk number 25: doBy.Rnw:546-547
###################################################
yvar <- c(0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0)


###################################################
### code chunk number 26: doBy.Rnw:554-555
###################################################
tvar <- seq_along(yvar) + c(0.1,0.2)


###################################################
### code chunk number 27: doBy.Rnw:560-561
###################################################
tse<- timeSinceEvent(yvar,tvar)


###################################################
### code chunk number 28: doBy.Rnw:576-581
###################################################
plot(sign.tse~tvar, data=tse, type="b")
grid()
rug(tse$tvar[tse$yvar==1], col="blue",lwd=4)
points(scale(tse$run), col=tse$run, lwd=2)
lines(abs.tse+.2~tvar, data=tse, type="b",col=3)


###################################################
### code chunk number 29: doBy.Rnw:585-590
###################################################
plot(tae~tvar, data=tse, ylim=c(-6,6),type="b")
grid()
lines(tbe~tvar, data=tse, type="b", col="red")
rug(tse$tvar[tse$yvar==1], col="blue",lwd=4)
lines(run~tvar, data=tse, col="cyan",lwd=2)


###################################################
### code chunk number 30: doBy.Rnw:594-598
###################################################
plot(ewin~tvar, data=tse,ylim=c(1,4))
rug(tse$tvar[tse$yvar==1], col="blue",lwd=4)
grid()
lines(run~tvar, data=tse,col="red")


###################################################
### code chunk number 31: doBy.Rnw:604-605
###################################################
tse$tvar[tse$abs<=1]


###################################################
### code chunk number 32: doBy.Rnw:612-615
###################################################
lynx <- as.numeric(lynx)
tvar <- 1821:1934
plot(tvar,lynx,type="l")


###################################################
### code chunk number 33: doBy.Rnw:621-625
###################################################
yyy <- lynx>mean(lynx)
head(yyy)
sss <- subSeq(yyy,TRUE)
sss


###################################################
### code chunk number 34: doBy.Rnw:629-631
###################################################
plot(tvar,lynx,type="l")
rug(tvar[sss$midpoint],col="blue",lwd=4)


###################################################
### code chunk number 35: doBy.Rnw:636-639
###################################################
yvar <- rep(0,length(lynx))
yvar[sss$midpoint] <- 1
str(yvar)


###################################################
### code chunk number 36: doBy.Rnw:643-645
###################################################
tse <- timeSinceEvent(yvar,tvar)
head(tse,20)


###################################################
### code chunk number 37: doBy.Rnw:651-654
###################################################
len1 <- tapply(tse$ewin, tse$ewin, length)
len2 <- tapply(tse$run, tse$run, length)
c(median(len1),median(len2),mean(len1),mean(len2))


###################################################
### code chunk number 38: doBy.Rnw:659-662
###################################################
tse$lynx <- lynx
tse2 <- na.omit(tse)
plot(lynx~tae, data=tse2)


###################################################
### code chunk number 39: doBy.Rnw:666-669
###################################################
plot(tvar,lynx,type="l",lty=2)
mm <- lm(lynx~tae+I(tae^2)+I(tae^3), data=tse2)
lines(fitted(mm)~tvar, data=tse2, col="red")


###################################################
### code chunk number 40: doBy.Rnw:682-683
###################################################
options(oopt)


###################################################
### code chunk number 41: doBy.Rnw:698-699
###################################################
CO2


###################################################
### code chunk number 42: doBy.Rnw:704-705
###################################################
head(airquality, n=20)


