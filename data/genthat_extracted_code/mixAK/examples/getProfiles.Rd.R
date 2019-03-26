library(mixAK)


### Name: getProfiles
### Title: Individual longitudinal profiles of a given variable
### Aliases: getProfiles
### Keywords: dplot

### ** Examples

data(PBCseq, package="mixAK")
ip <- getProfiles(t="day", y=c("age", "lbili", "platelet", "spiders"),
                  id="id", data=PBCseq)
print(ip[[2]])
print(ip[[34]])

XLIM <- c(0, 910)
lcol1 <- rainbow_hcl(1, start=40, end=40)

oldPar <- par(mfrow=c(1, 3), bty="n")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="lbili", tvar="day",
             xlab="Time (days)", col=lcol1, auto.layout=FALSE, main="Log(bilirubin)")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="platelet", tvar="day",
             xlab="Time (days)", col=lcol1, auto.layout=FALSE, main="Platelet count")
plotProfiles(ip=ip, data=PBCseq, xlim=XLIM, var="spiders",  tvar="day",
             xlab="Time (days)", col=lcol1, auto.layout=FALSE)
par(oldPar)



