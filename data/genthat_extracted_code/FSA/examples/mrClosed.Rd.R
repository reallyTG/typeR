library(FSA)


### Name: mrClosed
### Title: Estimate initial population size for single or multiple census
###   mark-recapture data.
### Aliases: mrClosed summary.mrClosed1 confint.mrClosed1 summary.mrClosed2
###   confint.mrClosed2 plot.mrClosed2
### Keywords: manip

### ** Examples

### Single census with no sub-groups
## Petersen estimate -- the default
mr1 <- mrClosed(346,184,49)
summary(mr1)
summary(mr1,verbose=TRUE)
summary(mr1,incl.SE=TRUE)
summary(mr1,incl.SE=TRUE,digits=1)
confint(mr1)
confint(mr1,verbose=TRUE)
confint(mr1,type="hypergeometric")

## Chapman modification of the Petersen estimate
mr2 <- mrClosed(346,184,49,method="Chapman")
summary(mr2,incl.SE=TRUE)
summary(mr2,incl.SE=TRUE,verbose=TRUE)

### Single census, using capHistSum() results
## data in capture history format
str(BluegillJL)
ch1 <- capHistSum(BluegillJL)
mr3 <- mrClosed(ch1)
summary(mr3,verbose=TRUE)
confint(mr3,verbose=TRUE)

### Single census with sub-groups
marked <- c(93,35,72,16,46,20)
captured <- c(103,30,73,17,39,18)
recaps <- c(20,23,52,15,35,16)
lbls <- c("YOY","Juvenile","Stock","Quality","Preferred","Memorable")
mr4 <- mrClosed(marked,captured,recaps,method="Ricker",labels=lbls)
summary(mr4)
summary(mr4,incl.SE=TRUE)
summary(mr4,incl.SE=TRUE,verbose=TRUE)
summary(mr4,incl.SE=TRUE,incl.all=FALSE,verbose=TRUE)
confint(mr4)
confint(mr4,verbose=TRUE)
confint(mr4,incl.all=FALSE,verbose=TRUE)

### Multiple Census
## Data in summarized form ... Schnabel method
mr5 <- with(PikeNY,mrClosed(n=n,m=m,R=R,method="Schnabel"))
plot(mr5)
plot(mr5,loess=TRUE)
summary(mr5)
summary(mr5,verbose=TRUE)
confint(mr5)
confint(mr5,verbose=TRUE)

## Schumacher-Eschmeyer method
mr6 <- with(PikeNY,mrClosed(n=n,m=m,R=R,method="Schumacher"))
summary(mr6)
confint(mr6)

### Capture history data summarized by capHistSum()
# ignore first column of ID numbers
ch2 <- capHistSum(PikeNYPartial1,cols2ignore="id")

## Schnabel method
mr7 <- mrClosed(ch2,method="Schnabel")
plot(mr7)
summary(mr7)
confint(mr7)




