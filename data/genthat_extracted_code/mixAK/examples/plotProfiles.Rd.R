library(mixAK)


### Name: plotProfiles
### Title: Plot individual longitudinal profiles
### Aliases: plotProfiles
### Keywords: dplot

### ** Examples

data(PBCseq, package="mixAK")
ip <- getProfiles(t="day", y=c("age", "fdrug", "bili", "platelet", "spiders"),
                  id="id", data=PBCseq)

XLIM <- c(0, 910)
lcol2 <- c("darkgreen", "red")

oldPar <- par(mfrow=c(1, 3), bty="n")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="bili", trans=log, tvar="day", gvar="fdrug",
             xlab="Time (days)", col=lcol2, auto.layout=FALSE, main="Log(bilirubin)",
             highlight=c(2, 4), col.highlight="darkblue")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="platelet", tvar="day", gvar="fdrug",
             xlab="Time (days)", col=lcol2, auto.layout=FALSE, main="Platelet count",
             highlight=c(2, 4), col.highlight="darkblue")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="spiders",  tvar="day", gvar="fdrug",
             xlab="Time (days)", col=lcol2, auto.layout=FALSE,
             lines=FALSE, points=TRUE,
             highlight=c(2, 4), col.highlight="darkblue", bg.highlight="skyblue") 
par(oldPar)



